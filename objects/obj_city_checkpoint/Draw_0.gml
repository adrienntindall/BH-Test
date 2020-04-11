/// @description Insert description here
// You can write your code in this editor

draw_self();

var th = image_angle*180/pi;

if(!open) draw_sprite_ext(spr_checkpoint_bar, 0, x + 32*cos(th), y + 32*sin(th), 1, 1, image_angle, c_white, 1);