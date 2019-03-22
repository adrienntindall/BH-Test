/// @description Handling enemy waves

var flag = false;

with(obj_enemy) {
	if(rn == other.cur_room) flag = true;
}

if((obj_player.x >= rx1) && (obj_player.x <= rx2) && (obj_player.y >= ry1) && (obj_player.y <= ry2)) {
	with(obj_door) {
		if(rn == other.cur_room) lock = true;
	}
}
else flag = true;

if(!flag) {
	if (cur_wave == array_length_1d(waves)) instance_destroy();
	else for(var c = 0; c < array_length_2d(waves, cur_wave); c++) {
		
		var xx = random(rx2 - rx1)+rx1;
		var yy = random(ry2 - ry1)+ry1;
		while(true) {
			while(tilemap_get_at_pixel(tm,xx, yy) == 1) {
				xx = random(rx2 - rx1)+rx1;
				yy = random(ry2 - ry1)+ry1;
			}
		
			var en = instance_create_depth(xx, yy, 1, waves[cur_wave, c]);
			if(wall_collision(tm, en, 0, 0)) instance_destroy(en);
			if(instance_exists(en)) break;
			xx = random(rx2 - rx1)+rx1;
			yy = random(ry2 - ry1)+ry1;
		}
		if(instance_exists(en)) {
			en.rx1 = rx1;
			en.rx2 = rx2;
			en.ry1 = ry1;
			en.ry2 = ry2;
			en.rn = cur_room;
		}
	}
	if(cur_wave == 0) {
		for(var c = 0; c < array_length_1d(bars); c++) {
			var bb = instance_create_depth(0, 0, 2, bars[c]);
			bb.xcorn1 = random(rx2 - rx1)+rx1;
			bb.xcorn2 = bb.xcorn1 + 64;
			bb.ycorn1 = random(ry2 - ry1)+ry1;
			bb.ycorn2 = bb.ycorn1 + 64;
			if(!check_legal(bb, tm)) {
				instance_destroy(bb);
				c--;
			}
		}
	}
	cur_wave++;
}