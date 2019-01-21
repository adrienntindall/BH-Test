/// @description Insert description here
// You can write your code in this editor

var flag = false;
if((obj_player.x >= rx1) && (obj_player.x <= rx2) && (obj_player.y >= ry1) && (obj_player.y <= ry2)) {
	with(obj_door) {
		if(rn == other.cur_room) lock = true;
	}	
}
with(obj_enemy) {
	if(rn == other.cur_room) flag = true;
}

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
			if(instance_exists(en)) break;
		}
		if(instance_exists(en)) {
			en.rx1 = rx1;
			en.rx2 = rx2;
			en.ry1 = ry1;
			en.ry2 = ry2;
			en.rn = cur_room;
		}
	}
	cur_wave++;
}