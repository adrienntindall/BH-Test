/// @description Insert description here
// You can write your code in this editor
enum options
{
	resume,
	weapons,
	armour,
	focus,
	level_edit,
	pat_edit,
	quit,
	length
}

enum menus {
	pause,
	weapons
}

menu[options.resume] = "Resume";
menu[options.weapons] = "Change Weapons";
menu[options.armour] = "Change Armoour";
menu[options.level_edit] = "Level Editor";
menu[options.quit] = "Quit";
menu[options.pat_edit] = "Pattern Editor";
menu[options.focus] = global.focus_names[global.focus]; 
space = 64;

mpos = 0;

fpos = global.focus;

tot = array_length_1d(menu);
tot_focus = array_length_1d(global.focus_inv);

prev_room = 0;

menu_obj = array(obj_menu_pause);

global.screenShot = -1;
global.pause = false;
global.cur_menu = menus.pause;
global.back_frame = 0;