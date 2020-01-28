///spawn_circular(n, bullet_type, parent, offset, r, cd, arr*, copy*, inst_copy*)
//@desc Circular bullet pattern with n spokes
///@param n
///@param {real} bullet_type  (object) bullet type
///@param {real} parent  id of parent of bullet
///@param theta
///@param radius
///@param cd
///@param storage*
///@param copy*
///@param inst_copy*
var n = argument[0];
var bt = argument[1];
var theta = 2*pi/n; 
var r = argument[4];
var arr = -1;
var store = false;
var copy = false;
var inst = noone;
if(argument_count > 6 && argument[6] == true) store = true;
if(argument_count > 8 && argument[7] == true) copy = true;
if(argument_count > 8) inst = argument[8];

if(cd[clay] <= 0) for (c = 0; c < n; c++) {
	var b = instance_create_depth(x+r*cos(theta*c),y-r*sin(theta*c),0, bt);
	if(copy) pat_var_copy(bt, b);
	b.theta = theta*c + argument[3];
	b.image_angle = b.theta*180/pi;
	b.parent = argument[2];
	b.t0 = t;
	cd[clay] = argument[5];
	if(store) arr[c] = b;
}
else if(!store) cd[clay] -= dt;

if(store && arr != -1) return arr;