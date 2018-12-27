///spawn_circular(n, bullet_type, parent)
//@desc Circular bullet pattern with n spokes
//@param {real} bullet_type  (object) bullet type
//@param {real} parent  id of parent of bullet

var n = argument0;
var bt = argument1;
var theta = 360/n;

for (c = 0; c < n; c++) {
	b = instance_create_depth(x,y,0,bt);
	b.direction = theta*c;
	b.image_angle = theta*c;
	b.theta = b.image_angle*pi/180;
	b.parent = argument2;
}