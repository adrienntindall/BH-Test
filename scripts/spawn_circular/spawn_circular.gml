///spawn_circular(n, bullet_type, parent, offset, r, cd)
//@desc Circular bullet pattern with n spokes
///@param n
///@param {real} bullet_type  (object) bullet type
///@param {real} parent  id of parent of bullet
///@param theta
///@param radius
///@param cd
var n = argument0;
var bt = argument1;
var theta = 2*pi/n; 
var r = argument4;

if(cd <= 0) for (c = 0; c < n; c++) {
	b = instance_create_depth(x+r*cos(theta*c),y-r*sin(theta*c),0,bt);
	b.theta = theta*c + argument3;
	b.image_angle = b.theta*180/pi;
	b.parent = argument2;
	b.t0 = t;
	cd = argument5;
}
else cd -= global.dt;