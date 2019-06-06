///objects_collide(obj1, obj2)
var obj1 = argument0;
var obj2 = argument1;

var dist = dist_between(obj1, obj2);
var theta = point_direction(obj1.x, obj1.y, obj2.x, obj2.y)*pi/180;
var mini = get_partial(obj1, theta) + get_partial(obj2, theta);

if(mini > dist) return true;
else return false;