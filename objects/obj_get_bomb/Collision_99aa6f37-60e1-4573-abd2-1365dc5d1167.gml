/// @description Insert description here
// You can write your code in this editor
if(!disp) {
	global.active_eq = array(obj_clear);
	global.active_own = array(obj_clear);
	obj_room_transition.act = true;
	audio_play_sound(snd_reward, 3, false);
	ds_map_set(global.save_data, map_id, false);
	disp = true;
}