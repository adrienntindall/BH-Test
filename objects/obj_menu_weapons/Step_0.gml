/// @description Insert description here
// You can write your code in this editor

var move = keyboard_check_pressed(ord("S"))-keyboard_check_pressed(ord("W"));
mpos = (mpos + move)%tot;

var select = keyboard_check_pressed(ord("E"));

var change = keyboard_check_pressed(ord("D"))-keyboard_check_pressed(ord("A"));

switch(mpos) {
	case options_w.back:
		if(select) room_goto(room_menu_pause);
		break;
	case options_w.weapon:
		if(change != 0) {
			wpos = (wpos+change)%tot_weapons;
			global.weapon = global.weapon_inv[wpos];
			menu[options_w.weapon] = global.weapon;
		}
		break;
	case options_w.weapon_alt:
		if(change != 0) {
			wapos = (wapos+change)%tot_weapons;
			global.weapon_alt = global.weapon_inv[wapos];
			menu[options_w.weapon_alt] = global.weapon_alt;
		}
		break;
	default:
		break;
}