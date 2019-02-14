/// @description Init variables
/// Some variables are declared in the "Variables definitions" window.

init_					= false;
light_count_			= instance_number(o_light_par);
// Surfaces
light_surf_				= -1;
shadow_surf_			= -1;
lightmap_surf_			= -1;
static_lightmap_surf_	= -1;

u_ambient_light_		= shader_get_uniform(sh_ambient_light, "u_fAmbientLight");

//Add tilemap here to cast shadows
tilemap_[0] = layer_tilemap_get_id("collider_16px");
if (layer_exists("collider_1px")) { tilemap_[1] = layer_tilemap_get_id("collider_1px"); }
	
if (foreground_depth_ != -1)
{
	var lf = instance_create_depth(x, y, foreground_depth_, o_light_drawer);
	lf.ambient_light_ = foreground_ambient_light_;
}

//Create vertex buffer
vertex_format_begin();
vertex_format_add_position();
vertex_format_add_color();
VertexFormat = vertex_format_end();

VBuffer = vertex_create_buffer();

#region check if surface exists
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