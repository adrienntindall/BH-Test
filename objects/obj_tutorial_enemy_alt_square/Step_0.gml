/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spawn_circular(4, x, y, obj_tutorial_enemy_card, id, cur_bul[0]*pi/4, 20, .4);

if(hp <= 0) {
	instance_destroy();
}