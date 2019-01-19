///spawn_arc_spread(n, bullet_type, parent, theta0, arc_length, cd_val)
///@param n
///@param bullet_type
///@param parent
///@param theta0
///@param arc_len
///@param cooldown

var n = argument0;
var theta = argument3;
var dtheta = argument4;

if(cd <= 0) {
	for(var c = 0; c < n; c++) {
		var bt = instance_create_depth(x, y, 0, argument1);
		bt.parent = argument2;
		bt.theta = theta + c*dtheta/n;
		bt.image_angle = bt.theta*180/pi;
	}
	cd = argument5;
}