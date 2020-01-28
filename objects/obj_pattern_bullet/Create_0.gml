/// @description Insert description here
// You can write your code in this editor

enum move_pat {
	linear,
	length	
};

pattern = move_pat.linear;

tilemap = layer_tilemap_get_id("Borders");

spd = 0;
defspd = 0;
a = 0;

theta = 0;

dt = 0;