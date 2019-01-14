/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var dt = global.dt;

if(scd <= 0) {
	var so = instance_create_depth(x, y, 1, obj_split_orb);
	so.theta = theta + rot*cur_s + pi/2;
	cur_s++;
	scd += .3;
}

scd -= dt;