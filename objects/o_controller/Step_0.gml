/// @description camera control

var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
var cw = camera_get_view_width(view_camera[0]);
var ch = camera_get_view_height(view_camera[0]);

if		(keyboard_check(vk_right)) { cx+=3; }
else if (keyboard_check(vk_down))  { cy+=3; }
else if (keyboard_check(vk_left))  { cx-=3; }
else if (keyboard_check(vk_up))    { cy-=3; }

cx = clamp(cx, 0, room_width - cw);
cy = clamp(cy, 0, room_height - ch);

camera_set_view_pos(view_camera[0], cx, cy);


