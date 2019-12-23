/// @description Insert description here
// You can write your code in this editor
t += delta_time/1000000;

if(keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_down)) {
	cur_pos = (cur_pos + 1) mod 2;
}

if(keyboard_check_released(ord("C"))) {
	if(cur_pos == 0) {
		room_goto(room_level_select);
	}
	else if(cur_pos == 1) {
		room_goto(room_creator);
	}
}

global.returnKey = vk_escape;