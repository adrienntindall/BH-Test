///spawn_circular(x, y, n, bullet_type, parent)
//@desc Circular bullet pattern with n spokes
//@param {real} x  x value for spawn
//@param {real} y  y value for spawn
//@param {real} bullet_type  (object) bullet type
//@param {real} parent  id of parent of bullet
var xx = argument0;
var yy = argument1;
var n = argument2;
var bt = argument3;
var theta = 360/n;

for (c = 0; c < n; c++) {
	b = instance_create_depth(x,y,0,bt);
	b.direction = theta*c;
	b.image_angle = theta*c;
	b.theta = b.image_angle*pi/180;
	b.parent = argument4;
}