/// @description Insert description here
// You can write your code in this editor

event_inherited();

if(hp <= 0) {
	bullet_heal(.002);
	instance_destroy();
}

enemy_move_circle();

spawn_circular_spray(pi/8,obj_bullet_enemy_linear, id, pi/2, 10, .15);
