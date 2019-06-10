/// @description Insert description here
// You can write your code in this editor
depth = 0;
image_angle = 0;
for(var c = tb; c < tf; c+=.05) {
	draw_sprite_ext(spr_lifesteal, 0, x_las_lin(id, c), y_las_lin(id, c), 1, 1, -theta*180/pi, c_white, .8);	
}