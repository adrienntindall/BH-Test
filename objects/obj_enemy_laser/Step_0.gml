/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

enemy_rotate();
enemy_move_circle();

lasers = spawn_circular(2, obj_laser_str_enemy, id, random(pi), 10, 3);

if(hp <=0) instance_destroy();