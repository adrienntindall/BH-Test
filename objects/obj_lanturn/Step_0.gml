/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(c_amnts[0] == c_max[0] && c_amnts[1] == c_max[1]) {
	image_index = 1;
	if(keyboard_check_pressed(release_btn)) {
		instance_create_depth(x, y, 1, obj_fireball);
		image_index = 0;
		c_amnts = zeros_arr(2);
	}
}