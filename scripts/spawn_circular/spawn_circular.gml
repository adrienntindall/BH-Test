///spawn_circular(n, bullet_type, parent, offset, r, cd, arr*, copy*)
//@desc Circular bullet pattern with n spokes
///@param n
///@param {real} bullet_type  (object) bullet type
///@param {real} parent  id of parent of bullet
///@param theta
///@param radius
///@param cd
///@param storage*
///@param copy*
var n = argument[0];
var bt = argument[1];
var theta = 2*pi/n; 
var r = argument[4];
var arr = -1;
var store = false;
var copy = false;
if(argument_count > 6 && argument[6] == true) store = true;
if(argument_count > 7 && argument[7] == true) copy = true;

if(cd[clay] <= 0) for (c = 0; c < n; c++) {
	var b = copy ? instance_copy(false) : instance_create_depth(x+r*cos(theta*c),y-r*sin(theta*c),0,bt);
	b.theta = theta*c + argument[3];
	b.image_angle = b.theta*180/pi;
	b.parent = argument[2];
	b.t0 = t;
	cd[clay] = argument[5];
	if(store) arr[c] = b;
}
else if(!store) cd[clay] -= dt;

if(store && arr != -1) return arr;