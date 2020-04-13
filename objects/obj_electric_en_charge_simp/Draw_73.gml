/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

draw_self();

if(psight && cd[0] <= 1) {
	var ptheta = angle_between(self, obj_player);
	draw_set_colour(c_yellow);
	draw_circle(x + 60*cos(ptheta), y - 60*sin(ptheta), 10, false);
	draw_set_colour(c_white);
}