/// @description Insert description here
// You can write your code in this editor



if(closing) {
	image_xscale += global.dt*cspd/scale_init;
	tilemap_set(bmap_id, 1, bbox_right/64, y/64);
	if(abs(image_xscale) > 4.5) {
		image_xscale = sign(image_xscale)*4.5;
	}
}
else if(obj_player.y > bbox_bottom) {
	tilemap_set(bmap_id, 0, bbox_right/64, y/64);
	image_xscale -= global.dt*cspd/(1.2*scale_init);
	if(abs(image_xscale) < 1) {
		image_xscale = sign(cspd);
	}
}

closing = (obj_player.y - y) >= 0 && (obj_player.y - y) <= obj_player.qspd/1.2 && obj_player.y > bbox_bottom;