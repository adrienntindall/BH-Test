/// @description Handling input to navigate the menu

if((global.cur_menu == menus.weapons) && global.pause) {
	tot_weapons = array_length_1d(global.weapon_inv);
	var move = keyboard_check_pressed(ord("S"))-keyboard_check_pressed(ord("W"));
	mpos = (mpos + move)%tot;

	var select = keyboard_check_pressed(ord("E"));

	var change = keyboard_check_pressed(ord("D"))-keyboard_check_pressed(ord("A"));

	switch(mpos) {
		case options_w.back:
			if(select) global.cur_menu = menus.pause;
			global.back_frame = 2;
			break;
		case options_w.weapon:
			if(change != 0) {
				wpos = (change == -1 && wpos == 0) ? tot_weapons-1 :(wpos+change)%tot_weapons;
				global.weapon = global.weapon_inv[wpos];
				menu[options_w.weapon] = global.weapon_names[global.weapon];
			}
			break;
		case options_w.weapon_alt:
			if(change != 0) {
				wapos = (change == -1 && wapos == 0) ? tot_weapons-1 : (wapos+change)%tot_weapons;
				global.weapon_alt = global.weapon_inv[wapos];
				menu[options_w.weapon_alt] = global.weapon_names[global.weapon_alt];
			}
			break;
		default:
			break;
	}
}