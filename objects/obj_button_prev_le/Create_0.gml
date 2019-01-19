/// @description Insert description here
// You can write your code in this editor

event_inherited();

y = (size-6)*64;

image_xscale *= -1;

enum le_menu {
	tiles,
	enemies,
	length
}

global.cur_menu = le_menu.tiles;
global.menus = array(obj_menu_tile_select, obj_menu_enemy_placer);