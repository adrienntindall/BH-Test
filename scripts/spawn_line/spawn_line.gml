//spawn_line(n, x, y, bt, parent, th_p, len, th_bt, cd)
///@param n
///@param x
///@param y
///@param bt
///@param parent
///@param th_p perpendicular theta
///@param len
///@param th_bt bullet's theta
///@param cd


var n = argument[0];
var xx = argument[1];
var yy = argument[2];
var th_p = argument[5];
var len = argument[6];
var th_bt = argument[7];
var bt = argument[3];

if(cd[clay] <= 0) {
	for(var c = 0; c < n; c++) {
		var tt = -len/2 + c*len/(n-1);
		var b = instance_create_depth(-tt*sin(th_p) + xx, -tt*cos(th_p) + yy, 0, bt);
		b.theta = th_bt;
		b.image_angle = b.theta*180/pi;
		b.parent = argument[4];
		b.t0 = t;
	}
	cur_bul[clay]++;
	cd[clay] = argument[8];
}
else cd[clay] -= dt;