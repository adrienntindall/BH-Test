/// @description Initializing Vars

//Weapon Options list
enum options_w {
	back,
	wp_case,
	wp_disp,
	wp_bt,
	wp_ex,
	wpa_case,
	wpa_disp,
	wpa_bt,
	wpa_ex,
	length
}

menu[options_w.back] = "Back";
menu[options_w.wp_case] = "Casing: " + global.case_names[global.weapon[0]];
menu[options_w.wp_disp] = "Dispensor: " +global.mv_names[global.weapon[1]];
menu[options_w.wp_bt] = "Bullet: " + global.bt_names[global.weapon[2]];
menu[options_w.wp_ex] = "Extra: " + global.ex_names[global.weapon[3]];
menu[options_w.wpa_case] = "Casing: " + global.case_names[global.weapon[4]];
menu[options_w.wpa_disp] = "Dispensor: " +global.mv_names[global.weapon[5]];
menu[options_w.wpa_bt] = "Bullet: " + global.bt_names[global.weapon[6]];
menu[options_w.wpa_ex] = "Extra: " + global.ex_names[global.weapon[7]];
//tot_weapons = array_length_1d(global.weapon_inv);

space = 64;

//Setting menu cursor position
mpos = 0;
wpos = 0;
tot = array_length_1d(menu);

prev_room = 0;