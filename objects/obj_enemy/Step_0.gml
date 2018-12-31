/// @description Insert description here
// You can write your code in this editor

if(hp <= 0) {
	bullet_heal(.002);
	instance_destroy();
}

if((obj_player.x >= rx1) && (obj_player.x <= rx2) && (obj_player.y >= ry1) && (obj_player.y <= ry2)) {
	var theta = point_direction(x0, y0, obj_player.x, obj_player.y)*pi/180;
	x0 += cos(theta)*fspd;
	y0 -= sin(theta)*fspd;
}


if(tilemap_get_at_pixel(tilemap, x0+r*cos((t+dt)/30), bbox_top) != 0 
	|| tilemap_get_at_pixel(tilemap, x0+r*cos((t+dt)/30), bbox_bottom) != 0) {
	dt *= -1;
}

if(tilemap_get_at_pixel(tilemap, bbox_left, y0+r*sin((t+dt)/30)) != 0 
	|| tilemap_get_at_pixel(tilemap, bbox_right, y0+r*sin((t+dt)/30)) != 0) {
	dt *= -1;
}

t += dt;

x = x0+r*cos(t/30);
y = y0+r*sin(t/30);

if(hp >3 ? t%40 == 0:t%20 == 0) {
	spawn_circular(n, obj_bullet_enemy, id);
}