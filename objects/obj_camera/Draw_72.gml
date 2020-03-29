/// @description Insert description here
// You can write your code in this editor
if(cur_frame < 2) {
	var hratio = def_height/surface_get_height(application_surface);
	var wratio = def_width/surface_get_width(application_surface);
	if(surface_exists(pan_surf)) {
		surface_set_target(pan_surf);
		draw_sprite_ext(pan_image, 0, 0, 0, wratio, hratio, 0, c_white, 1);
		surface_reset_target();
		draw_surface(pan_surf, pan_x, pan_y);
	}
}