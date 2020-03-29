/// @description Insert description here
// You can write your code in this editor
if(global.cont) {
	if(!sprite_exists(screenshot)) {
		screenshot = sprite_create_from_surface(application_surface,0,0,view_xport[0],view_yport[0],0,0,0,0);
	}
	if(credit <= 0) {
		cur_select = 1;
	}
	else if(keyboard_check_pressed(vk_down) || keyboard_check_pressed(vk_up)) {
		cur_select = (cur_select + 1) mod 2;
	}
	if(keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter)) {
		switch(cur_select) {
			case 0:
				instance_activate_all();
				obj_player.hp = obj_player.maxhp;
				credit--;
				global.cont = false;
				break;
			case 1:
				game_end();
				break;
		}
	}
}