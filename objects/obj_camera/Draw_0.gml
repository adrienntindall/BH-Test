/// @description Insert description here
// You can write your code in this editor
if(pan) {
	surface_set_target(pan_surf);
	draw_sprite_ext(pan_image, 0, 0, 0, obj_camera.def_width/surface_get_width(application_surface), obj_camera.def_height/surface_get_height(application_surface), 0, c_white, 1);
	surface_reset_target();
	draw_surface(pan_surf, pan_x, pan_y);
	switch(pan_dir) {
		case trans_dir.north:
			pan_y += pan_yv*dt;
			break;
		case trans_dir.south:
			pan_y -= pan_yv*dt;
			break;
	}
	if(t >= .5) {
		surface_free(pan_surf);
		pan = false;
		camera_set_view_target(playerCamera, self);
		t = 0;
	}
}