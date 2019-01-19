///spawn_circular_spray(dtheta, bullet_type, parent, offset, cd)
///@param delta_theta
///@param bullet_type
///@param parent
///@param offset
///@param cooldown_reset_value

var dt = global.dt;
var dtheta = argument0;
var bullet = argument1;
var parent = argument2;
var theta0 = argument3;

if(cd <= 0) {
	var bt = instance_create_depth(x, y, 1, bullet);
	bt.theta = theta0+dtheta*cur_bul;
	bt.image_angle = bt.theta*180/pi;
	cd += argument4;
	cur_bul++;
	
}
else cd -= dt;