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
var n = argument[0];
var bt = argument[1];
var theta = 2*pi/n; 
var r = argument[4];
var arr = -1;
var store = false;
var copy = false;
if((argument_count > 6 && argument[6] == true) || (bt.isLazer && laz_arr == -1)) store = true;
if(argument_count > 7 && argument[7] == true) copy = true;

if(cd[clay] <= 0) for (var c = 0; c < n; c++) {
	var b = noone;
	var th = theta*c + argument[3];
	var xx = x+r*cos(th);
	var yy = y-r*sin(th);
	if(bt.isLazer && laz_arr != -1) {
		b = laz_arr[c];
		b.x = xx;
		b.y = yy;
	}
	else if(copy) b = bullet_copy(bt, xx, yy);
	else b = instance_create_depth(xx,yy,0,bt);
	b.theta = th;
	b.image_angle = b.theta*180/pi;
	b.parent = argument[2];
	b.t0 = t;
	cd[clay] = argument[5];
	cur_bul[clay]++;
	if(store) arr[c] = b;
}
else cd[clay] -= dt;

if(store && arr != -1 && !bt.isLazer) return arr;
else if(store) laz_arr = arr;