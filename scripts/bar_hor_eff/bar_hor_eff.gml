///barrier_hor_eff(obj)
///@param obj
///@param d*

var obj = argument[0];

switch(object_index) {
	case obj_bounce_barrier:
		obj.theta *= -1;
		obj.image_angle *= -1;
		obj.ty = -1*obj.ty;
		obj.ty0 = obj.t;
	case obj_speed_barrier:
		
		break;
}