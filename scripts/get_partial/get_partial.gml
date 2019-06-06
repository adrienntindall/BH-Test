///get_partial(obj, theta)
///@param obj
///@param theta
var obj = argument0;
var theta = argument1;

var c = 0;

switch(obj.cshape) {
	case shape.circle:
		c=obj.crad;
		break;
	case shape.rectangle:
		theta += image_angle*pi/180;
		if((theta%pi) <= obj.in_theta || (theta%pi) >= pi-obj.in_theta) {
			c=abs(obj.hrad*sec(theta));	
		}
		else c=abs(obj.vrad*sec(pi/2-theta));
		break;
}
show_debug_message(c);
return c;