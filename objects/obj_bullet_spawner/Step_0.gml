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
	case spawn_op.arc:
		spawn_arc_spread(n, bullet, obj_enemy_anchor, theta+dtheta*cur_bul[0], angle, rad, def_cd, true);
		break;
}

switch(path) {
	case path_op.circular:
		enemy_move_circle();
		break;
}

//copying
if(mouse_check_button_pressed(mb_left) && dist_between_point(self, mouse_x, mouse_y) < 16) {
	if(cur_lag_time >= 0) {
		var ni = instance_copy(false);
		ni.x += 20;
		ni.y += 20;
		ni.bullet = bullet_copy(bullet, ni.x, ni.y);
		ni.bullet.tag = true;
	}
	else cur_lag_time = lag_time;
}

cur_lag_time -= delta_time/1000000; //dt might be frozen

//moving
if(mouse_check_button(mb_left) && dist_between_point(self, mouse_x, mouse_y) < 16) {
	x = mouse_x;
	y = mouse_y;
}