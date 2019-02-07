/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

cdepth = obj_pattern_enemy.cdepth + 1;
	
vars = (cdepth > 0) ? obj_pattern_viewer.splits : obj_pattern_viewer.vars;
	
l = obj_pattern_enemy.clay;

pattern = vars[po.bt_mov, l];

x_egg = vars[po.x_ex, l];
y_egg = vars[po.y_ex, l];
x_disp = vars[po.x_disp, l];

spd = vars[po.bt_spd, l];
a = vars[po.bt_a, l];
tspd = vars[po.bt_tspd, l];
ta = vars[po.bt_ta, l];
minspd = vars[po.bt_spd_min, l];
maxspd = vars[po.bt_spd_max, l];

tts = vars[po.bt_tts, l];
	
sprite_index = obj_pattern_viewer.bt_sprs[vars[po.bt_spr, l]];
