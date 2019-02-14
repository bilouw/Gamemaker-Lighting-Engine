/// @description draw lights

if (!init_)
{
	event_user(0);
	init_ = true;
}

#region Check if surfaces exists.
if( !surface_exists(light_surf_) ){
	light_surf_ = surface_create(128 ,128);
}
if( !surface_exists(shadow_surf_) ){
	shadow_surf_ = surface_create(room_width ,room_height);
}
if( !surface_exists(lightmap_surf_) ){
	lightmap_surf_ = surface_create(camera_get_view_width(view_camera[0]) ,camera_get_view_height(view_camera[0]));
}
if( !surface_exists(static_lightmap_surf_) ){
	static_lightmap_surf_ = surface_create(room_width ,room_height);
}
#endregion

light_count_ = instance_number(o_light_par);

var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
var cw = camera_get_view_width(view_camera[0]);
var ch = camera_get_view_height(view_camera[0]);

var first_light = true;
for(var i=0; i<light_count_; i++)
{	
	var light = instance_find(o_light_par, i);
	
	if (!light.static_)
	{
		var lx = light.lx_;
		var ly = light.ly_;
		var rad = light.rad_;
		var scale = light.scale_;
	
		//draw shadows
		surface_set_target(shadow_surf_);
			draw_clear_alpha(0,0);
			project_shadow(lx, ly, rad, tilemap_);
		surface_reset_target();
	
		//draw the light
		surface_resize(light_surf_, rad, rad);
		surface_set_target(light_surf_);
			draw_sprite_ext(s_light_mask_128px, 0, 0, 0, scale, scale, 0, c_white, 1);
			draw_surface_part(shadow_surf_, lx-(rad/2), ly-(rad/2), rad, rad, 0, 0);
		surface_reset_target();
	
		// copy lights on final surf 
		var surfx = (lx - cx) - (rad/2);
		var surfy = (ly - cy) - (rad/2);
	
		surface_set_target(lightmap_surf_);
			if (first_light){ draw_clear_alpha(0,1); first_light = false;}
			gpu_set_blendmode(bm_max);
			draw_surface(light_surf_, surfx, surfy);
			gpu_set_blendmode(bm_normal);
		surface_reset_target();
	
		//clear light surf
		surface_set_target(light_surf_);
			draw_clear_alpha(0,1);
		surface_reset_target();
	}	
}

//blend static and dynamic light surfaces
gpu_set_blendmode(bm_max);
surface_resize(light_surf_, cw, ch);
surface_set_target(light_surf_);
	draw_clear_alpha(0,0);
	draw_surface(lightmap_surf_, 0, 0);
	draw_surface_part(static_lightmap_surf_, cx, cy, cw, ch, 0, 0);
surface_reset_target();

// draw final surf
gpu_set_blendmode_ext(bm_dest_color, bm_zero);
shader_set(sh_ambient_light);
	shader_set_uniform_f(u_ambient_light_, ambient_light_);
	draw_surface(light_surf_, cx, cy);
shader_reset();
gpu_set_blendmode(bm_normal);