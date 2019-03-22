/// @description Barrier resizing and movement
var dt = global.dt;  

var xdis = dt*xspd;
if(sign(xspd) == sign(xcycle)) {
	if(tilemap_collision_line(xcorn2+xdis, ycorn1, xcorn2+xdis, ycorn2, tm)) { xspd *= -1; xcycle*=-1; }
	xcorn2 += dt*xspd;
}
else {
	if(tilemap_collision_line(xcorn1+xdis, ycorn1, xcorn1+xdis, ycorn2, tm)) { xspd *= -1; xcycle *=-1}
	xcorn1 += dt*xspd;
}

var ydis = dt*yspd;
if(sign(yspd) == sign(ycycle)) {
	if(tilemap_collision_line(xcorn1, ycorn2+ydis, xcorn2, ycorn2+ydis, tm)) { yspd *= -1; ycycle *= -1; }
	ycorn2 += dt*yspd;
}
else {
	if(tilemap_collision_line(xcorn1, ycorn1+ydis, xcorn2, ycorn1+ydis, tm)) { yspd *= -1; ycycle *= -1; }
	ycorn1 += dt*yspd;
}

cur_time -= dt;
if(cur_time <= 0) {
	xcycle *= -1;
	ycycle *= -1;
	cur_time += period;
}