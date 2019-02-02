///spawn_arc_spray(n, bullet_type, parent, theta0, dtheta, arc_length, radius, cd_val)
///@param n
///@param bullet_type
///@param parent
///@param theta0
///@param dtheta
///@param arc_len
///@param radius
///@param cooldown

var n = argument0;
var theta = argument3;
var dtheta = argument4;
var dtheta2 = argument5;

if(cd <= 0) {
	for(var c = 0; c < n; c++) {
		var theta_c = theta + c*dtheta2/n;
		var bt = instance_create_depth(x+r*cos(theta_c), y-r*sin(theta_c), 0, argument1);
		bt.parent = argument2;
		bt.theta = cur_bul*dtheta + theta + c*dtheta2/n;
		bt.image_angle = bt.theta*180/pi;
	}
	cd = argument7;
	cur_bul++;
}
else cd -= dt;