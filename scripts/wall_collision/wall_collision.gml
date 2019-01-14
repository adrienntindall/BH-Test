///wall_collision(tilemap, object_id, dx*, dy*)
///@param tilemap
///@param object_id
///@param dx*
///@param dy*
var tm = argument0;
var obj = argument1;
var dx = argument2;
var dy = argument3;
with(obj) {
	return (tilemap_get_at_pixel(tm, bbox_left+dx, bbox_top+dy) != 0) ||
			(tilemap_get_at_pixel(tm, bbox_right+dx, bbox_top+dy) != 0) ||
			(tilemap_get_at_pixel(tm, bbox_left+dx, bbox_bottom+dy) != 0) ||
			(tilemap_get_at_pixel(tm, bbox_right+dx, bbox_bottom+dy) != 0)
}