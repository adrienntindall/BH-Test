/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

enemy_stalk_player(frad, 15, -90);

spawn_circular(5, x, y, obj_tutorial_bt_spade, id, theta, 0, 1.5);

if(hp <= 0) instance_destroy();