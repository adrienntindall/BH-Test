/// @description Insert description here
// You can write your code in this editor
dt = global.dt;

if(hit) {
	if(t == 0) {
		if(min(obj_player.x, room_width-obj_player.x) <= def_width/2) x = (obj_player.x < room_width/2 ? def_width/2 : room_width - def_width/2);
		x0 = x;
		k = choose(1,-1)*(random(7) + 8);
	}
	camera_set_view_target(playerCamera, noone);
	var cycle = sspd_max*(-(t-cycle_time)*(t-cycle_time)/(cycle_time*cycle_time) + 1)*sin(k*t);
	x = x0 + cycle
	y = lerp(y, obj_player.y, .1);
	if(min(obj_player.y, room_height-obj_player.y) <= def_height/2) {
		y = (obj_player.y < room_height/2 ? def_height/2 : room_height - def_height/2);
	}
	t += dt;
	camera_set_view_pos(view_camera[0], x - def_width/2, y - def_height/2);
	if(t >= cycle_time) {
		hit = false;
		camera_set_view_target(playerCamera, self);
	}
}
else if(pan) {
	switch(pan_dir) {
		case trans_dir.north:
			x = lerp(x, obj_player.x, .1);
			y = min(pan_y, room_height - def_height/2);
			break;
		case trans_dir.south:
			x = lerp(x, obj_player.x, .1);
			y = max(pan_y, def_height/2);
			break;
	}
	if(x > room_width - def_width/2) x = room_width - def_width/2;
	if(x < def_width/2) x = def_width/2;
	
	camera_set_view_pos(view_camera[0], x - def_width/2, y - def_height/2);
	t+=dt;
}
else if(object_exists(obj_player)) {
	x = lerp(x, obj_player.x, .1);
	y = lerp(y, obj_player.y, .1);
}