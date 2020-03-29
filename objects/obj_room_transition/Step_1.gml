/// @description Insert description here
// You can write your code in this editor

if(objects_collide(self, obj_player)) {
	if(act && r_dest != -1) {
		persistent = true;
	
		xoff = obj_player.x-bbox_left;
		cxoff = obj_camera.x - bbox_left;
		obj_camera.pan_surf = surface_create(obj_camera.def_width, obj_camera.def_height);
		obj_camera.pan_image = sprite_create_from_surface(application_surface,0,0,surface_get_width(application_surface),surface_get_height(application_surface),0,0,0,0);
		camera_set_view_target(obj_camera.playerCamera, noone);
		
		room_goto(r_dest);
		
		panning = true;
		
		obj_camera.cur_frame = 0;
		
		draw_frame0 = true;
		
		
		x = -100;
		y = -100;
		
		
	}
}