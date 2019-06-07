/// @description Insert description here
// You can write your code in this editor
depth = 0;
for(var c = tb; c < tf; c+=.05) {
	//Need to fix the image angle that lasers go at to make them perpendicular to the path being traveled
	draw_sprite_ext(spr_lifesteal, 0, x_las_lin(id, c), y_las_lin(id, c), 1, 1, theta*180/pi+90, c_white, .8);	
}