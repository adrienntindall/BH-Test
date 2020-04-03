/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(keyboard_check_pressed(release_btn) && c_amnts[0] >= 10 && !pulse) {
	c_amnts[0] -= 10;
	pulse = true;
}

if(pulse) with(obj_bullet_enemy) {
	if(dist_between(id, other) < other.cur_rad) {
		instance_destroy();
	}
}
