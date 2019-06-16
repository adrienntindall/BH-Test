/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

r = 40;
w_spd = 10;
defspd = 0;

hp = 10;

layer = 0;
clay = 0;
cd[0] = 0;
lasers = spawn_circular(2, obj_laser_str_enemy, id, random(pi), 10, 3, true);

for(var c = 0; c < array_length_1d(lasers); c++) {
	lasers[c].spd = 10;
	lasers[c].defspd = 10;
	lasers[c].image_angle = lasers[c].theta*180/pi-90;
}