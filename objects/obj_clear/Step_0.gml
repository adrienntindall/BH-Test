/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(keyboard_check_pressed(release_btn) && c_amnts[0] >= 10 && !pulse) {
	c_amnts[0] -= 10;
	pulse = true;
	x0 = x;
	y0 = y;
	audio_play_sound(snd_bomb, 2, false);
	audio_sound_gain(snd_bomb, .2, 0);
}

if(pulse) with(obj_bullet_enemy) {
	if(dist_between_point(id, other.x0, other.y0) < other.cur_rad) {
		instance_destroy();
	}
}
