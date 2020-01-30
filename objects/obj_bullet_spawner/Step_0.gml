/// @description Insert description here
// You can write your code in this editor

dt = global.dt;

if(mouse_check_button_pressed(mb_right) && dist_between_point(self, mouse_x, mouse_y) < 16) {
	if(keyboard_check(vk_shift)) {
		instance_destroy(bullet);
		instance_destroy();
		exit;
	}
	else {
		obj_property_editor.editingMode = true;
		obj_property_editor.curObj = id;
	}
}



switch(pattern) {
	case spawn_op.circular:
		spawn_circular(n, bullet, obj_enemy_anchor, theta+dtheta*cur_bul[0], rad, def_cd, false, true);
		break;
	case spawn_op.circular_spray:
		spawn_circular_spray(dtheta, bullet, obj_enemy_anchor, theta, rad, def_cd, true);
		break;
	case spawn_op.arc:
		spawn_arc_spread(n, bullet, obj_enemy_anchor, theta, angle, rad, def_cd, true);
		break;
}

switch(path) {
	case path_op.circular:
		enemy_move_circle();
		break;
}

