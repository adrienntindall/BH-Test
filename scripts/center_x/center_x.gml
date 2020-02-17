///center_x(obj)
///@param obj

var obj = argument0;

if(variable_instance_exists(obj, "centerx")) {
	return obj.centerx;
}
else return obj.x;