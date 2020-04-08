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
	var th = image_angle*pi/180;
	var r = get_partial(self, th);
	var rx = r*cos(th);
	var ry = r*sin(th);
	return (tilemap_get_at_pixel(tm, center_x(self)+rx+dx, center_y(self)+ry+dy) != 0) ||
			(tilemap_get_at_pixel(tm, center_x(self)-rx+dx, center_y(self)+ry+dy) != 0) ||
			(tilemap_get_at_pixel(tm, center_x(self)+rx+dx, center_y(self)-ry+dy) != 0) ||
			(tilemap_get_at_pixel(tm, center_x(self)-rx+dx, center_y(self)-ry+dy) != 0)
}