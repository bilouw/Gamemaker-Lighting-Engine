/// @description Insert description here
// You can write your code in this editor

var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
var surf = o_light_handler.light_surf_;

if (surface_exists(surf))
{
	gpu_set_blendmode_ext(bm_dest_color, bm_zero);
	shader_set(sh_ambient_light);
		shader_set_uniform_f(u_ambient_light_, ambient_light_);
		draw_surface(o_light_handler.light_surf_, cx, cy);
	shader_reset();
	gpu_set_blendmode(bm_normal);
}