/// @description Insert description here
// You can write your code in this editor
if(hp <= 0) {
	bullet_heal(.1);
	instance_destroy();
}

if(!following) {
	if((obj_player.x >= rx1) && (obj_player.x <= rx2) && (obj_player.y >= ry1) && (obj_player.y <= ry2)) following = true;
}
else {
	var theta = point_direction(x, y, obj_player.x, obj_player.y)*pi/180;
	var dx = cos(theta)*fspd*dt;
	var dy = -sin(theta)*fspd*dt;
	
	//wall collisions
	var bbox_side;

	if(dx > 0) bbox_side = bbox_right; else bbox_side = bbox_left;

	if(tilemap_get_at_pixel(tilemap, bbox_side + dx, bbox_top) != 0 
		|| tilemap_get_at_pixel(tilemap, bbox_side+dx, bbox_bottom) != 0) {
		if(dx > 0) x = x - (x % 64) + 63 - (bbox_right - x);
		else x = x - (x % 64) - (bbox_left-x);
		dx = 0;
	}

	if(dy > 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;

	if(tilemap_get_at_pixel(tilemap, bbox_left, bbox_side + dy) != 0 
		|| tilemap_get_at_pixel(tilemap, bbox_right, bbox_side+dy) != 0) {
		if(dy > 0) y = y - (y % 64) + 63 - (bbox_bottom - y);
		else y = y - (y % 64) - (bbox_top-y);
		dy = 0;
	}
	
	x += dx;
	y += dy;
	if(fspd < fspdmax) fspd += fspda*dt;	
}