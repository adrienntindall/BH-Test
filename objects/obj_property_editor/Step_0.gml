/// @description Insert description here
// You can write your code in this editor

if(!editingMode) {
	exit;
}

if(!sprite_exists(screenshot)) {
	screenshot = sprite_create_from_surface(application_surface,0,0,room_width,room_height,0,0,0,0);
	instance_deactivate_all(true);
}

if(keyboard_check_pressed(vk_escape)) {
	editingMode = false;
	sprite_delete(screenshot);
	instance_activate_all();
	with(obj_pattern_bullet) {
		if(!tag) instance_destroy();
	}
	instance_destroy(input_box);
	instance_destroy(obj_arrow);
	curObj.pattern = cur_spawn;
	curObj.path = cur_path;
	curObj.cur_bul[0] = 0;
	obj_bullet_spawner.t = 0;
}
