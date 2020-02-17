/// @description Insert description here
// You can write your code in this editor
dt = global.dt;

event_inherited();

move_lazer_linear();

centerx = x + hrad*image_xscale*cos(theta);
centery = y - hrad*image_xscale*sin(theta);