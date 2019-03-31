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
		case options_w.wp_case:
		case options_w.wpa_case:
			if(change != 0) {
				wpos = (change == -1 && wpos == 0) ? wp_sp.length-1 :(wpos+change)%wp_sp.length;
				global.weapon[mpos-1] = wpos;
				menu[mpos] = "Casing: " + global.case_names[wpos];
			}
			break;
		case options_w.wp_disp:
		case options_w.wpa_disp:
			if(change != 0) {
				wpos = (change == -1 && wpos == 0) ? wp_mv.length-1 :(wpos+change)%wp_mv.length;
				global.weapon[mpos-1] = wpos;
				menu[mpos] = "Dispensor: " + global.mv_names[wpos];
			}
			break;
		case options_w.wp_bt:
		case options_w.wpa_bt:
			if(change != 0) {
				wpos = (change == -1 && wpos == 0) ? wp_bt.length-1 :(wpos+change)%wp_bt.length;
				global.weapon[mpos-1] = wpos;
				menu[mpos] = "Bullet: " + global.bt_names[wpos];
			}
			break;
		case options_w.wp_ex:
		case options_w.wpa_ex:
			if(change != 0) {
				wpos = (change == -1 && wpos == 0) ? wp_ex.length-1 :(wpos+change)%wp_ex.length;
				global.weapon[mpos-1] = wpos;
				menu[mpos] = "Extra: " + global.ex_names[wpos];
			}
			break;
		default:
			break;
	}
}