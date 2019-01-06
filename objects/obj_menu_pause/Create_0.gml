/// @description Insert description here
// You can write your code in this editor
enum options
{
	resume,
	weapons,
	armour,
	level_edit,
	quit
}

menu[options.resume] = "Resume";
menu[options.weapons] = "Change Weapons";
menu[options.armour] = "Change Armoour";
menu[options.level_edit] = "Level Editor";
menu[options.quit] = "Quit";

space = 64;

mpos = 0;

tot = array_length_1d(menu);

prev_room = 0;