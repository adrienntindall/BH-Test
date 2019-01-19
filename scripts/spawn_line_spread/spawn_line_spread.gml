///spawn_line_spread(n, bullet_type, parent, x1, y1, x2, y2, movement_theta, cooldown)
///@param n
///@param bullet_type
///@param parent
///@param x1
///@param y1
///@param x2
///@param y2
///@param mov_theta
///@param cd

var dt = global.dt;

var n = argument0;
var xx = argument3;
var yy = argument4;

if(cd <= 0) {
	var dx = (argument5-xx)/n;
	var dy = (argument6-yy)/n;

	for(var c = 0; c < n; c++) {
		var bt = instance_create_depth(xx+dx*c, yy+dy*c, 0, argument1);
		bt.theta = argument7;
		bt.image_angle = bt.theta*180/pi;
		bt.parent = argument2;
		if(wall_collision(tilemap, bt, 0, 0)) instance_destroy(bt);
	}
	
	cd = argument8;
}
else cd -= dt;