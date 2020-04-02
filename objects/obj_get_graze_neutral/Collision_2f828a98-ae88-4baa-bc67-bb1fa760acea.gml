/// @description Insert description here
// You can write your code in this editor

if(!disp) {
	global.graze_bts = array(obj_graze_ball_neutral);
	obj_room_transition.act = true;
	ds_map_set(global.save_data, map_id, false);
	disp = true;
	audio_play_sound(snd_reward, 3, false);
}