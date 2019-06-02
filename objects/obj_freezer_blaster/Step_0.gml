/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(keyboard_check(release_btn) && c_amnts[0] >= 15 && c_amnts[1] >= 15) {
	c_amnts[0] -= 15;
	c_amnts[1] -= 15;
	instance_create_depth(x, y, 1, obj_freezer_blast);
}