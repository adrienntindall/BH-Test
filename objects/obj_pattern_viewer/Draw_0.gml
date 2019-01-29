/// @description Insert description here
// You can write your code in this editor
for(var c = 0; c < min(max_box, array_length_1d(var_ops)-cur_window*max_box); c++) {
	draw_set_colour(c_black);
	draw_set_font(menu_font);
	draw_text(10, 48+c*ydis, var_names[var_ops[cur_window*max_box+c]]);
}