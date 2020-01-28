/// @description Insert description here
// You can write your code in this editor

dt = global.dt;

switch(pattern) {
	case pat.circular:
		//spawn_circular(n, obj_pattern_bullet, obj_enemy_anchor, theta, rad, def_cd, false, true, bullet);
		break;
}

if(mouse_check_button_pressed(mb_right) && dist_between_point(self, mouse_x, mouse_y) < 16) {
	obj_property_editor.editingMode = true;
	obj_property_editor.curObj = id;
}