/// @description Drawing the state of the menu

if(global.pause && global.cur_menu == menus.pause) {
	if(sprite_exists(global.screenShot)) draw_sprite_ext(global.screenShot,0, 0,0,view_wport/camera_get_view_width(0),view_hport/camera_get_view_height(0),0,c_white,1);
	
	draw_set_colour(c_black);
	draw_set_alpha(.4);
	draw_rectangle(0, 0, view_wport, view_hport, false);
	draw_set_alpha(1);

	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_font(menu_font);
	draw_set_colour(c_white);

	for(c = 0; c < tot; c++) {
		if(c == mpos) draw_set_colour(c_blue);
		draw_text(1024+space, 750+space*c, string(menu[c]));	
		if(c == mpos) draw_set_colour(c_white);
	}
}