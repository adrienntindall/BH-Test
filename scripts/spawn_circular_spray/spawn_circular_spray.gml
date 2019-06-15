///spawn_circular_spray(dtheta, bullet_type, parent, offset, radius, cd)
///@param delta_theta
///@param bullet_type
///@param parent
///@param offset
///@param radius
///@param cooldown_reset_value

var dtheta = argument0;
var bullet = argument1;
var parent = argument2;
var th0 = argument3;
var r = argument4;

if(cd[clay] <= 0) {
	var theta = th0+dtheta*cur_bul[clay];
	var bt = instance_create_depth(x+r*cos(theta), y-r*sin(theta), 1, bullet);
	bt.theta = theta;
	bt.image_angle = bt.theta*180/pi;
	bt.parent = parent;
	cd[clay] += argument5;
	cur_bul[clay] += 1;
	
}
else cd[clay] -= dt;