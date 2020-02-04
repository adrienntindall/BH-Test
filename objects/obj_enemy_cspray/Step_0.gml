/// @description Insert description here
// You can write your code in this editor

event_inherited();

if(hp <= 0) {
	bullet_heal(.002);
	instance_destroy();
}

enemy_move_circle();

