/// @description Insert description here
// You can write your code in this editor

if(playMusic) {
	if(!init) {
		var snd = audio_play_sound(audio, 1, false);
		init = true;
	}
	if(!audio_is_playing(audio)){
		var snd = audio_play_sound(audio, 1, false);
		audio_sound_set_track_position(snd, loop_point);	
	}
}