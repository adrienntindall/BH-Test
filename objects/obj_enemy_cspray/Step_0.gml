/// @description Insert description here
// You can write your code in this editor

if(hp <= 0) {
	bullet_heal(.002);
	instance_destroy();
}

enemy_move_circle();

spawn_circular_spray(pi/8,obj_bullet_enemy, id, pi/2, 10, .15);
