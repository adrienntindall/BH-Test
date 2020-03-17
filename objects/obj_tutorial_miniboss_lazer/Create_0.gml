/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

defspd = 50;
spd = 50;
a = 100;
maxspd = 500;

destroy = false;

hrad = 1/2;
vrad = (bbox_bottom-bbox_top)/2;
cshape = shape.rectangle;
in_theta = arctan2(vrad, hrad);

centerx = 0;
centery = 0;