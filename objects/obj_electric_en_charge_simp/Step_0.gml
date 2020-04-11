/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spawn_circular(1, x, y, obj_electric_bt_charge_fast, id, angle_between(self, obj_player), 20, 3);

if(hp <= 0) instance_destroy();