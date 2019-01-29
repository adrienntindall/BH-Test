/// @description Insert description here
// You can write your code in this editor

var dt = global.dt;

if(tts <= 0) {
	spawn_circular(2, obj_split_bullet, noone, theta, 10, 0);
	instance_destroy();
}

tts -= dt;
