/// @description Insert description here
// You can write your code in this editor

if(cd <= 0) {
	instance_create_depth(random(room_width), random(room_height), 1, obj_enemy);
	cd = 60;
}

cd--;