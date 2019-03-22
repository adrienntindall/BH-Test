///check_legal(barrier, tm)
///@param bar_id
///@param tilemap

var bar = argument0;
var tm = argument1;

if(tilemap_get_at_pixel(tm, bar.xcorn1, bar.ycorn1) != 0 || tilemap_get_at_pixel(tm, bar.xcorn1, bar.ycorn2) != 0 ||
	tilemap_get_at_pixel(tm, bar.xcorn2, bar.ycorn1) != 0 || tilemap_get_at_pixel(tm, bar.xcorn2, bar.ycorn2) != 0)
	return false;
return true;