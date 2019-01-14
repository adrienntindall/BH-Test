/// @description Insert description here
// You can write your code in this editor

var dt = global.dt;

if(hp <= 0) {
	bullet_heal(.002);
	instance_destroy();
}

if((obj_player.x >= rx1) && (obj_player.x <= rx2) && (obj_player.y >= ry1) && (obj_player.y <= ry2)) {
	var theta = point_direction(x0, y0, obj_player.x, obj_player.y)*pi/180;
	if !(tilemap_get_at_pixel(tilemap, x0+dt*cos(theta)*fspd+r*cos(t+sdt*dt), bbox_top) != 0 
	|| tilemap_get_at_pixel(tilemap, x0+dt*cos(theta)*fspd+r*cos(t+sdt*dt), bbox_bottom) != 0)
		x0 += dt*cos(theta)*fspd;
	if!(tilemap_get_at_pixel(tilemap, bbox_left, y0-dt*sin(theta)*fspd+r*sin(t+sdt*dt)) != 0 
	|| tilemap_get_at_pixel(tilemap, bbox_right, y0-dt*sin(theta)*fspd+r*sin(t+sdt*dt)) != 0)
		y0 -= dt*sin(theta)*fspd;
}


if(tilemap_get_at_pixel(tilemap, x0+r*cos(t+sdt*dt), bbox_top) != 0 
	|| tilemap_get_at_pixel(tilemap, x0+r*cos(t+sdt*dt), bbox_bottom) != 0) {
	sdt *= -1;
}

if(tilemap_get_at_pixel(tilemap, bbox_left, y0+r*sin(t+sdt*dt)) != 0 
	|| tilemap_get_at_pixel(tilemap, bbox_right, y0+r*sin(t+sdt*dt)) != 0) {
	sdt *= -1;
}

t += sdt*dt;

x = x0+r*cos(t);
y = y0+r*sin(t);

if(hp >3 ? (p1cd <= 0):(p2cd <= 0)) {
	spawn_circular(n, obj_bullet_enemy, id, 0);
	p1cd = 1.2;
	p2cd = .7;
}

p1cd-=dt;
p2cd-=dt;