/// @description Insert description here
// You can write your code in this editor

if(playMusic) {
	if(!init) {
		snd = audio_play_sound(audio, 1, false);
		init = true;
	}
	if(!audio_is_playing(audio)){
		snd = audio_play_sound(audio, 1, false);
		audio_sound_set_track_position(snd, loop_point);
	}
}

if(instance_exists(obj_tutorial_miniboss) || instance_exists(obj_tutorial_boss)) {
	if(audio != snd_midboss_theme) {
		init = false;
		end_audio(snd);
	}
	audio = snd_midboss_theme;
	loop_point = 2;
	audio_sound_gain(audio, .65, 0);
}
else {
	if(audio != sound_music) {
		init = false;
		end_audio(snd);
	}
	audio = sound_music;
	loop_point = 25.5;
	audio_sound_gain(audio, .6, 0);
}
ds_map_destroy(frame_sound);
frame_sound = ds_map_create();