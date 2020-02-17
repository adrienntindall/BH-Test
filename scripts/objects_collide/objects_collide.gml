///objects_collide(obj1, obj2)
var obj1 = argument0;
var obj2 = argument1;

var dist = dist_between_points(center_x(obj1), center_y(obj1), center_x(obj2), center_y(obj2));
var theta = pi-point_direction(center_x(obj1), center_y(obj1), center_x(obj2), center_y(obj2))*pi/180;
var mini = get_partial(obj1, theta) + get_partial(obj2, theta);

if(mini > dist) {
	return true;	
}
else return false;