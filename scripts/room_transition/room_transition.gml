///room_transition_begin(room_next)
///@param room_next
///@param direction


var sur_r1 = surface_create(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
surface_copy(sur_r1, 0, 0, application_surface);

room_goto(argument0);

return sur_r1;