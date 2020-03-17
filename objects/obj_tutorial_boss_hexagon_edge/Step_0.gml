/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

image_blend = c_orange;

move_linear();

if(spd == minspd && hang_time > 0) {
	hang_time-=dt;
	if(hang_time <= 0) {
		a = 200;
		maxspd = 1000;
	}
}