///barrier_hor_eff(obj)
///@param obj
///@param d*

var obj = argument[0];

switch(object_index) {
	case obj_bounce_barrier:
		obj.theta *= -1;
		obj.image_angle *= -1;
		obj.yacc_dis = ty*sqrt((y0-y)*(y0-y) + (x0-x)*(x0-x))/sin(theta);
		obj.ty = -1*obj.ty;
		obj.y0 = obj.y;
		break;
	case obj_speed_barrier:
		
		break;
}