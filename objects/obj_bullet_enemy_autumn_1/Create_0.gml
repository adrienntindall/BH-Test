/// @description Insert description here
// You can write your code in this editor
event_inherited();
spd = 200;
defspd = spd;
a = -35;
minspd = 50;

hrad = (bbox_right-bbox_left)/2;
vrad = (bbox_bottom-bbox_top)/2;
cshape = shape.rectangle;
in_theta = arctan2(vrad, hrad);