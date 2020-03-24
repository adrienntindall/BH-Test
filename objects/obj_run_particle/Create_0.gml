/// @description Insert description here
// You can write your code in this editor

dt = 0;

image_alpha = .3 + random(.5);

image_xscale *= 5;
image_yscale *= 5;

theta = 0;
life = .1 + random(.3);
spd = 150;
a = -1.2*spd/life;
image_blend = c_gray;
tilemap = layer_tilemap_get_id("Borders");