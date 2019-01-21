/// @description Insert description here
// You can write your code in this editor
if(lock) {
	draw_set_colour(c_aqua);
	draw_rectangle(x, y, x+64, y+64, false);
	tilemap_set_at_pixel(tm, 1, x, y);
}