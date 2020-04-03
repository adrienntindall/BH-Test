/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

draw_self();

draw_set_colour(c_red);
draw_circle(x + (xrad-6)*cos(ptheta), y - (yrad-6)*sin(ptheta), 4, false);
draw_set_colour(c_white);