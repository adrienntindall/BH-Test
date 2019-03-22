///deep_lines_cross(x1, y1, x2, y2, obj_id, dx, dy)
///@param x1
///@param y1
///@param x2
///@param y2
///@param obj_id
///@param dx
///@param dy

var x1 = argument0; var y1 = argument1; var x2 = argument2; var y2 = argument3;
var obj = argument4; var dx = argument5; var dy = argument6;

if(!instance_exists(obj)) return false;
if(lines_cross(x1, y1, x2, y2, obj.bbox_left, obj.bbox_top, obj.bbox_left+dx, obj.bbox_top+dy) ||
	lines_cross(x1, y1, x2, y2, obj.bbox_right, obj.bbox_top, obj.bbox_right+dx, obj.bbox_top+dy) ||
	lines_cross(x1, y1, x2, y2, obj.bbox_left, obj.bbox_bottom, obj.bbox_left+dx, obj.bbox_bottom+dy) ||
	lines_cross(x1, y1, x2, y2, obj.bbox_right, obj.bbox_bottom, obj.bbox_right+dx, obj.bbox_bottom+dy))
	return true;
return false;