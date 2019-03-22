/// @description Insert description here
// You can write your code in this editor

colour = c_fuchsia;

xcorn1 = 0; xcorn2 = 0;
ycorn1 = 0; ycorn2 = 0;

rn = 0;

xspd = 100;
yspd = 100;

xtarget = 0;
ytarget = 0;

period = 2; //seconds
cur_time = period;
xcycle = 1;
ycycle = 1;

lid = layer_get_id("Borders");
tm = layer_tilemap_get_id(lid);