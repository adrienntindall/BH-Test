/// @description Insert description here
// You can write your code in this editor

draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(menu_font);
draw_set_colour(c_white);

for(c = 0; c < tot; c++) {
	if(c == mpos) draw_set_colour(c_blue);
	draw_text(x + space, y + space*c, string(menu[c]));	
	if(c == mpos) draw_set_colour(c_white);
}