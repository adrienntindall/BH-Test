//spawn_line(n, x, y, th_p, len, th_bt, bt, cd, parent)
///@param n
///@param x
///@param y
///@param th_p perpendicular theta
///@param len
///@param th_bt bullet's theta
///@param bt
///@param cd
///@param parent

var n = argument[0];
var xx = argument[1];
var yy = argument[2];
var th_p = argument[3];
var len = argument[4];
var th_bt = argument[5];
var bt = argument[6];

if(cd[clay] <= 0) for(var c = 0; c < n; c++) {
	var tt = -len/2 + c*len/(n-1);
	var b = instance_create_depth(-tt*sin(th_p) + xx, -tt*cos(th_p) + yy, 0, bt);
	b.theta = th_bt;
	b.image_angle = b.theta*180/pi;
	b.parent = argument[8];
	b.t0 = t;
	cd[clay] = argument[7];
	cur_bul[clay]++;
}
else cd[clay] -= dt;