/// @description Insert description here
// You can write your code in this editor



if(closing) {
	image_xscale += global.dt*cspd/scale_init;
	tilemap_set(bmap_id, 1, bbox_right/64, y/64);
	audio_resume_sound(close_snd);
	if(abs(image_xscale) > 4.5) {
		image_xscale = sign(image_xscale)*4.5;
		audio_pause_sound(close_snd);
	}
	
}
else if(obj_player.y > bbox_bottom) {
	audio_pause_sound(close_snd);
	tilemap_set(bmap_id, 0, bbox_right/64, y/64);
	image_xscale -= global.dt*cspd/(1.2*scale_init);
	if(abs(image_xscale) < 1) {
		image_xscale = sign(cspd);
	}
	audio_sound_set_track_position(close_snd, 0);
}
else audio_pause_sound(close_snd);

closing = (obj_player.y - y) >= 0 && (obj_player.y - y) <= obj_player.qspd/1.2 && obj_player.y > bbox_bottom;