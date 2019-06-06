/// @description Insert description here
// You can write your code in this editor
event_inherited();
theta = 0;
parent = noone;
spd = 90;
defspd = spd;
life = 6;
tilemap = layer_tilemap_get_id("Borders");
t0 = 0;
feff = false;
a = 0;
minspd = 0;
maxspd = 0;
t=0;
tspd = 1;
ta = 0;
x0 = x;
y0 = y;
is_knife = false;
is_split_cannon = false;
tx = 1;
ty = 1;
grtime = "nah";

hrad = (bbox_right-bbox_left)/2;
vrad = (bbox_bottom-bbox_top)/2;
cshape = shape.rectangle;
in_theta = arctan2(vrad, hrad);