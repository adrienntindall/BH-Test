/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(keyboard_check_pressed(release_btn) && c_amnts[0] >= 100) {
	c_amnts[0] -= 100;
	spawn_circular(32, obj_bomb, noone, 0, 10, 1);
}
