/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

ptheta = point_direction(x, y, obj_player.x, obj_player.y)*pi/180;

//rad = xrad*yrad/sqrt(xrad*xrad*sin(ptheta)*sin(ptheta) + yrad*yrad*cos(ptheta)*cos(ptheta));

spawn_circular(1, x + xrad*cos(ptheta), y - yrad*sin(ptheta), obj_tutorial_bt_spade, self, ptheta, 0, .8);

if(hp <= 0) instance_destroy();