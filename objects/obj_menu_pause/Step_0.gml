/// @description Insert description here
// You can write your code in this editor

var pbutt = keyboard_check_pressed(vk_escape);

if(pbutt) global.pause = !global.pause;

if(pbutt && global.pause) {
	if(!sprite_exists(screenShot)){
        screenShot = sprite_create_from_surface(application_surface,0,0,view_wport,view_hport,0,0,0,0);    
    }	
	instance_deactivate_all(true);
}

if(!global.pause) { 
	instance_activate_all(); 
	if(sprite_exists(screenShot)) sprite_delete(screenShot);
	exit;
}


var move = keyboard_check_pressed(ord("S"))-keyboard_check_pressed(ord("W"));
mpos = (mpos + move)%tot;

var change = keyboard_check_pressed(ord("D"))-keyboard_check_pressed(ord("A"));

var select = keyboard_check_pressed(ord("E"));

if(select) switch(mpos) {
	case options.resume:
		global.pause = false;
		instance_activate_all(); 
		if(sprite_exists(screenShot)) sprite_delete(screenShot);
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