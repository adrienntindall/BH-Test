/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

psight = player_in_sight();
if(psight) {
	enemy_stalk_player(250, 40, -200);
	spawn_arc_spread(3, obj_electric_bt_charge_fast, id, angle_between(self, obj_player) - 1.5*pi/8, 3*pi/8, 20, 2, false);
}

if(hp <= 0) instance_destroy();