///barrier_vter_eff(obj)
///@param obj

var obj = argument[0];

switch(object_index) {
	case obj_bounce_barrier:
		obj.theta = pi-obj.theta;
		obj.image_angle = 180-obj.image_angle;
		obj.tx = -obj.tx;
		obj.tx0 = obj.t;
		break;
	case obj_speed_barrier:
		
		break;
}