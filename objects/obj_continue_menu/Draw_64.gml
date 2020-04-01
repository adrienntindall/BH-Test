/// @description Insert description here
// You can write your code in this editor
if(global.cont) {
	draw_sprite(screenshot, 0, 0, 0);
	draw_set_colour(c_gray);
	draw_set_alpha(.6);
	draw_rectangle(0, 0, surface_get_width(application_surface), surface_get_height(application_surface), false);
	draw_set_colour(c_white);
	draw_set_alpha(1);
	draw_set_halign(fa_center);

	draw_set_font(font_menu);
	
	draw_text_transformed(surface_get_width(application_surface)/2, (720/2 - 225)*global.c, "Continue?", 2.2*global.c, 2.2*global.c, 0);
	if(credit <= 0) draw_set_colour(c_ltgray);
	else if(cur_select == 0) draw_set_colour(c_yellow); 
	draw_text_transformed(surface_get_width(application_surface)/2, (720/2 - 100)*global.c, "Yes", global.c, global.c, 0);
	
	if(cur_select == 1) draw_set_colour(c_yellow);
	else draw_set_colour(c_white);
	draw_text_transformed(surface_get_width(application_surface)/2, (720/2 - 25)*global.c, "No", global.c, global.c, 0);
	
	draw_set_colour(c_white);
	draw_text_transformed(surface_get_width(application_surface)/2, (720/2 + 50)*global.c, "Credits: " + string(credit), .5*global.c, .5*global.c, 0);
	draw_set_halign(fa_left);
	draw_set_colour(c_white);
}