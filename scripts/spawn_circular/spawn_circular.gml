///spawn_circular(n, bullet_type, parent, offset, r, cd, arr*)
//@desc Circular bullet pattern with n spokes
///@param n
///@param {real} bullet_type  (object) bullet type
///@param {real} parent  id of parent of bullet
///@param theta
///@param radius
///@param cd
///@param storage*
var n = argument[0];
var bt = argument[1];
var theta = 2*pi/n; 
var r = argument[4];
var arr = -1;
var store = false;
if(argument_count > 6 && argument[6] == true) store = true;

if(cd[clay] <= 0) for (c = 0; c < n; c++) {
	var b = instance_create_depth(x+r*cos(theta*c),y-r*sin(theta*c),0,bt);
	b.theta = theta*c + argument[3];
	b.image_angle = b.theta*180/pi;
	b.parent = argument[2];
	b.t0 = t;
	cd[clay] = argument[5];
	if(store) arr[c] = b;
}
else if(!store) cd[clay] -= global.dt;

if(store && arr != -1) return arr;