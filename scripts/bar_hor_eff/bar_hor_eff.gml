///barrier_hor_eff(obj)
///@param obj

var obj = argument0;

switch(object_index) {
	case obj_bounce_barrier:
		obj.theta *= -1;
		obj.image_angle *= -1;
		//obj.x += obj.spd*global.dt*cos(obj.theta);
		break;
	case obj_speed_barrier:
		
		break;
}