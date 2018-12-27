/// @description Insert description here
// You can write your code in this editor

var move = keyboard_check_pressed(ord("S"))-keyboard_check_pressed(ord("W"));
mpos = (mpos + move)%tot;

var select = keyboard_check_pressed(ord("E"));

if(select) switch(mpos) {
	case options.resume:
		room_goto(room0);
		break;
	case options.weapons:
		//room_goto(room_menu_weapons);
		break;
	case options.armour:
		//room_goto(room_menu_armour);
		break;
	case options.quit:
		game_end();
		break;
	default:
		break;
}