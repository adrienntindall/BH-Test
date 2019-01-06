/// @description Insert description here
// You can write your code in this editor

var move = keyboard_check_pressed(ord("S"))-keyboard_check_pressed(ord("W"));
mpos = (mpos + move)%tot;

var change = keyboard_check_pressed(ord("D"))-keyboard_check_pressed(ord("A"));

var select = keyboard_check_pressed(ord("E"));

if(select) switch(mpos) {
	case options.resume:
		room_goto(room0);
		break;
	case options.weapons:
		room_goto(room_menu_weapons);
		break;
	case options.armour:
		//room_goto(room_menu_armour);
		break;
	case options.quit:
		game_end();
		break;
	case options.level_edit:
		room_goto(level_editor);
		break;
	default:
		break;
}
if(change != 0) switch(mpos) {	
	case options.focus:
		if(change != 0) {
			fpos = (change == -1 && fpos == 0) ? tot_focus-1 :(fpos+change)%tot_focus;
			global.focus = global.focus_inv[fpos];
			menu[options.focus] = global.focus;
		}
		break;
	default:
		break;
}