/// @description Insert description here
// You can write your code in this editor
waves[0, 0] = 0;
cur_wave = 0;
cur_room = 0;

rx1 = 0; rx2 = 0; ry1 = 0; ry2 = 0;

lid = layer_get_id("Borders");
tm = layer_tilemap_get_id(lid);