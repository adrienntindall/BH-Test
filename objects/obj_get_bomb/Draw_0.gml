/// @description Insert description here
// You can write your code in this editor
if(disp) {
	draw_set_font(font_menu);
	draw_set_color(c_gray);
	draw_set_halign(fa_center);
	draw_text_transformed(x, y + yoff, "Bomb Acquired!", .6, .6, 0);
	draw_text_transformed(x, y + yoff + 30, "Clear bullets in a radius!", .4, .4, 0);
	draw_set_halign(fa_left);
	draw_set_colour(c_white);
	yoff -= global.dt*30;
	disp_time -= global.dt;
	if(disp_time <= 0) instance_destroy();
}
else draw_self();