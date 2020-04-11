/// @description Insert description here
// You can write your code in this editor
image_blend = c_white;

dt = global.dt;
//if(instance_exists(parent) && parent.slow) dt*=.75;

if(grtime == "nah") graze(true);
else if(grtime < 0 && global.graze_bts[0] != -1) {
	graze(true);
	var gb;
	if(limit_bts == -1) {
		gb = instance_create_depth(obj_player.x, obj_player.y, 1, global.graze_bts[floor(random(array_length_1d(global.graze_bts)))]);
	}
	else {
		gb = instance_create_depth(obj_player.x, obj_player.y, 1, limit_bts[floor(random(array_length_1d(limit_bts)))]);
	}
	gb.theta = random(2*pi);
	switch(gb.object_index) {
		case obj_graze_ball_electric:
			obj_player.tdash_charge = min(obj_player.tdash_charge + .05, obj_player.tdash_charge_max);
			break;
		default:
			break;
	}
	var gr_snd = audio_play_sound(sound_graze, 2, false);
	audio_sound_pitch(gr_snd, random(.4) + .8);
	audio_sound_gain(gr_snd, .2, 0);
	
}
grtime = min(grtime-dt, graze(false));
