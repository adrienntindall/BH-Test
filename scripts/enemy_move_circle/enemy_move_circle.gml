///enemy_move_circle()

if(tilemap_get_at_pixel(tilemap, x0+r*cos(t+sdt*dt), bbox_top) != 0 
	|| tilemap_get_at_pixel(tilemap, x0+r*cos(t+sdt*dt), bbox_bottom) != 0) {
	sdt *= -1;
}

if(tilemap_get_at_pixel(tilemap, bbox_left, y0+r*sin(t+sdt*dt)) != 0 
	|| tilemap_get_at_pixel(tilemap, bbox_right, y0+r*sin(t+sdt*dt)) != 0) {
	sdt *= -1;
}

t += sdt*dt;

x = x0+r*cos(t);
y = y0+r*sin(t);
