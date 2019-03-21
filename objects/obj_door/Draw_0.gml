/// @description Draw the door, if it's closed

if(lock) {
	draw_set_colour(c_aqua);
	draw_rectangle(x, y, x+64, y+64, false);
	tilemap_set_at_pixel(tm, 1, x, y);
}