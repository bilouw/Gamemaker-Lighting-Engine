/// @description static lights calcul

#region check if surfaces exists
if( !surface_exists(light_surf_) ){
	light_surf_ = surface_create(128 ,128);
}
if( !surface_exists(shadow_surf_) ){
	shadow_surf_ = surface_create(room_width ,room_height);
}
if( !surface_exists(static_lightmap_surf_) ){
	static_lightmap_surf_ = surface_create(room_width ,room_height);
}
#endregion

var first_light = true;
for(var i=0; i<light_count_; i++)
{	
	var light = instance_find(o_light_par, i);
	
	if (light.static_)
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
		var surfx = (lx) - (rad/2);
		var surfy = (ly) - (rad/2);
	
		surface_set_target(static_lightmap_surf_);
			if (first_light){ draw_clear_alpha(0,1); first_light = false;}
			gpu_set_blendmode(bm_max);
				draw_surface(light_surf_, surfx, surfy);
			gpu_set_blendmode(bm_normal);
		surface_reset_target();
	
		//clear surf
		surface_set_target(light_surf_);
			draw_clear_alpha(0,1);
		surface_reset_target();
		surface_set_target(shadow_surf_);
			draw_clear_alpha(0,0);
		surface_reset_target();
	}	
}
