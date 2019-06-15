/// @description Insert description here
// You can write your code in this editor
event_inherited();

if(hp <= 0) {
	bullet_heal(.02);
	instance_destroy();
}

spawn_arc_spread(3, obj_bullet_enemy_autumn_1, id, cur_bul[0]*theta, 3*pi/8, 20, .3);