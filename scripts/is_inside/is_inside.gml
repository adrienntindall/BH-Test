///is_inside(obj, barrier)
///@param obj_id
///@param barrier_id

var obj = argument0;
var barrier = argument1;

if(obj.x >= barrier.xcorn1 && obj.x <= barrier.xcorn2 &&
	obj.y >= barrier.ycorn1 && obj.y <= barrier.ycorn2)
	return true;
return false;