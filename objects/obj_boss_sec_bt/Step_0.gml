/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

image_blend = c_fuchsia;

move_linear();

if(stall_time > 0 && spd == minspd) {
	stall_time -= dt;
	if(stall_time <= 0) {
		spd = 200;
		defspd = spd;
		a = 100;
		maxspd = 500;
	}
}