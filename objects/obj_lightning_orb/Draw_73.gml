/// @description Insert description here
// You can write your code in this editor
if(draw_ln) {
	draw_set_alpha(alpha_time/dur);
	draw_line_width_color(x, y, en[0].x, en[0].y, 6, c_blue, c_aqua);
	for(var c = 0; c < array_length_1d(en)-1; c++)  {
		draw_line_width_color(en[c].x, en[c].y, en[c+1].x, en[c+1].y, 6, c_blue, c_aqua);
	}
	draw_set_alpha(1);
	alpha_time -= dt;
	if(alpha_time < 0) {
		alpha_time = dur;
		draw_ln = false;
	}
}