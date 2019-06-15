///spawn_arc_spread(n, bullet_type, parent, theta0, arc_length, radius, cd_val)
///@param n
///@param bullet_type
///@param parent
///@param theta0
///@param arc_len
///@param radius
///@param cooldown

var n = argument0;
var theta = argument3;
var dtheta = argument4;
var r = argument5;

if(cd[clay] <= 0) {
	for(var c = 0; c < n; c++) {
		var theta_c = theta + c*dtheta/n;
		var bt = instance_create_depth(x+r*cos(theta_c), y-r*sin(theta_c), 0, argument1);
		bt.parent = argument2;
		bt.theta = theta + c*dtheta/n;
		bt.image_angle = bt.theta*180/pi;
	}
	cd[clay] = argument6;
	cur_bul[clay] = cur_bul[clay] + 1;
}
else cd[clay] -= dt;