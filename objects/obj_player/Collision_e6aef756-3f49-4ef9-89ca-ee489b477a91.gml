/// @description Insert description here
// You can write your code in this editor
if(!invincible) {
	hp--;
	invincible=true;
	invcd = obj_camera.cycle_time;
	obj_camera.hit = true;
	obj_camera.t = 0;
	audio_play_sound(snd_take_damage, 1, false);
	with(obj_graze_ball) instance_destroy();
}
