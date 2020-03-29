/// @description Initializing variables

//Setting up options
enum options
{
	resume,
	quit,
	length
}

enum menus {
	pause,
	weapons
}

menu[options.resume] = "Resume";
menu[options.quit] = "Quit";
space = 64;

mpos = 0;

tot = array_length_1d(menu);

global.screenShot = -1;
global.pause = false;
global.cur_menu = menus.pause;
global.back_frame = 0;