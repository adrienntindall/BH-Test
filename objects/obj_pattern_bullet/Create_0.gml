/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

l = obj_pattern_enemy.clay;

pattern = obj_pattern_viewer.bt_mov[l];

x_egg = obj_pattern_viewer.vars[po.x_ex, l];
y_egg = obj_pattern_viewer.vars[po.y_ex, l];
x_disp = obj_pattern_viewer.vars[po.x_disp, l];

spd = obj_pattern_viewer.vars[po.bt_spd, l];
a = obj_pattern_viewer.vars[po.bt_a, l];
tspd = obj_pattern_viewer.vars[po.bt_tspd, l];
ta = obj_pattern_viewer.vars[po.bt_ta, l];
minspd = obj_pattern_viewer.vars[po.bt_spd_min, l];
maxspd = obj_pattern_viewer.vars[po.bt_spd_max, l];
