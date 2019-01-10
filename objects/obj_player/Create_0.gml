/// @description Defining Variables
// You can write your code in this editor
cd = 0;
kcd = .5;
lock = noone;
hp = 3;
maxhp = 3;
spd = 210;
fspd = 120;
t = 0;
dt = delta_time;
tilemap = layer_tilemap_get_id("Borders");
dodging = false;
mask_index = spr_player;
bombs = 2;
bomb_r = 200;
bomb_damage = 20;
boss_defeated = false;
kix = 0;

enum weapon_list {
	simple,
	simple_alt,
	octo,
	knives
}
global.weapon = weapon_list.simple;
global.weapon_alt = weapon_list.simple_alt;
global.weapon_inv[0] = weapon_list.simple;
global.weapon_inv[1] = weapon_list.simple_alt;
global.weapon_inv[2] = weapon_list.octo;
global.weapon_inv[3] = weapon_list.knives;

enum focus_list {
	basic,
	time_slow,
	shield
}
global.focus = focus_list.basic;
global.focus_inv[0] = focus_list.basic;
global.focus_inv[1] = focus_list.time_slow;
global.focus_inv[2] = focus_list.shield;
tscd = 0;
tslim = 90;
shcd = 180;
fshbr = false;