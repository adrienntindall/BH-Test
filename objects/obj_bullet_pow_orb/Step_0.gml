/// @description Insert description here
// You can write your code in this editor

var dt = global.dt;

x0 = obj_player.x;
y0 = obj_player.y;

r = max(mind, min(maxd, point_distance(obj_player.x, obj_player.y, mouse_x, mouse_y)));
var theta = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y)*pi/180;
rotate_2d(r*cos(t), r*sin(t), theta-period/2);
x += x0;
y = y0 - y;

if(t > period || t < 0) {
	sdt *= -1;	
}

t += sdt*dt;
refresh-=dt;