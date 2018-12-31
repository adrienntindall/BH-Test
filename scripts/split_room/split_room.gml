///split_room(x_bound1, y_bound1, x_bound2, y_bound2, n, rootpath)

var x1 = argument0; //x of top left corner
var y1 = argument1; //y of top left corner
var x2 = argument2; //x of bottom right corner
var y2 = argument3; //y of bottom right corner
var n = argument4; //number of times left to split
var rp = argument5;

var dx = x2-x1;
var dy = y2-y1;

if(n == 0) {
	rx1[rn] = x1;
	rx2[rn] = x2;
	ry1[rn] = y1;
	ry2[rn] = y2;
	rn++;
}
else if(dx < 17 || dy < 17) split_room(x1, y1, x2, y2, 0, rp);
else {
	var dir, xy, dxy1, dxy2;
	while(true) {
		dir = round(random(1));
		xy = dir ? random(dx) + x1 : random(dy) + y1;
		dxy1 = dir ? xy-x1 : xy-y1;
		dxy2 = dir ? x2-xy : y2-xy;
		if(dxy1 < 8 || dxy2 < 8) continue;
		else {
			rpath[rn] = 10*rp;
			split_room(x1, y1, (dir ? xy : x2), (dir ? y2 : xy), n-1, 10*rp);
			rpath[rn] = 10*rp + 1;
			split_room((dir ? xy : x1), (dir ? y1 : xy), x2, y2, n-1, 10*rp+1);
			break;
		}
	}
}