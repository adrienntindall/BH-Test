///tilemap_collision_line(x1, y1, x2, y2, tilemap)
///@param x1
///@param y1
///@param x2
///@param y2
///@param tilemap

var x1 = argument0; var y1 = argument1;
var x2 = argument2; var y2 = argument3;
var tm = argument4;

for(var h = x1; (x1 < x2) ? h <= x2 : h >= x2; h += (x1 < x2) ? 64 : -64) {
	for(var v = y1; (y1 < y2) ? v <= y2 : v >= y2; v += (y1 < y2) ? 64 : -64) {
		if(tilemap_get_at_pixel(tm, h, v) != 0) 
			return true;
	}
}
return false;