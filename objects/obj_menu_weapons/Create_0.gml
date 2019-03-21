/// @description Initializing Vars

//Weapon Options list
enum options_w {
	back,
	weapon,
	weapon_alt
}

menu[options_w.back] = "Back";
menu[options_w.weapon] = global.weapon_names[global.weapon];
menu[options_w.weapon_alt] = global.weapon_names[global.weapon_alt];

tot_weapons = array_length_1d(global.weapon_inv);

space = 64;

//Setting menu cursor position
mpos = 0;
wpos = findIndex(global.weapon_inv, global.weapon);
wapos = findIndex(global.weapon_inv, global.weapon_alt);

tot = array_length_1d(menu);

prev_room = 0;