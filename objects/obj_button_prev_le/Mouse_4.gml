/// @description Insert description here
// You can write your code in this editor

instance_destroy(global.menus[global.cur_menu]);

global.cur_menu = global.cur_menu - 1;

if(global.cur_menu == -1) global.cur_menu = le_menu.length-1;

instance_create_depth(0, 0, 0, global.menus[global.cur_menu]);