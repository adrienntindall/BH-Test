/// @description Insert description here
// You can write your code in this editor
var dt = global.dt;

if(mode == 0) {
	x0 = obj_player.x;
	y0 = obj_player.y;
	
	x = x0+r*dt*cos(2*pi*t/w);
	y = y0+r*dt*sin(2*pi*t/w);
	
	image_angle = point_direction(x0, y0, x, y);
	
}
else if(mode == 1) {
	spd = 25;
	if((x-x0)*(x-x0) + (y-y0)*(y-y0) < maxd*maxd) {
		move_linear();
	}
	else  mode = 2;
}
if(mode == 2) {
	spd = 10;
	
	x0 = obj_player.x;
	y0 = obj_player.y;
	
	theta = point_direction(x, y, x0+r*dt*cos(2*pi*t/w), y0+r*dt*sin(2*pi*t/w))*pi/180;
	
	image_angle = theta*180/pi;
	
	move_linear();
	
	var tx = x0+dt*r*cos(2*pi*t/w);
	var ty = y0+dt*r*sin(2*pi*t/w);
	var dx = dt*spd*cos(theta);
	var dy = -dt*spd*sin(theta);
	var sx = x > tx;
	var sy = y > ty;
	
	if((sx ? (x+dx < tx) : (x+dx > tx)) && (sy ? (y+dy < ty) : (y+dy > ty))) {
		mode = 0;
	}
}

t++;