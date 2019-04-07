/// @description Defining Variables
depth = 2;
cd = array(0, 0);
kcd = .5;
lock = noone;
hp = 3;
maxhp = 3;
spd = 250;
fspd = 155;
t = 0;
dt = delta_time;
tilemap = layer_tilemap_get_id("Borders");
dodging = false;
mask_index = spr_player_female;
bombs = 2;
bomb_r = 200;
bomb_damage = 20;
boss_defeated = false;
kix = 0;
clay = 0;

enum weapon_list {
	simple,
	simple_alt,
	octo,
	knives,
	pow_orb,
	split_orb,
	flamethrower,
	life_channel,
	length
}
global.weapon = zeros_arr(8);
global.weapon_alt = weapon_list.simple_alt;
global.weapon_inv = array(weapon_list.simple, weapon_list.simple_alt);

global.weapon_names = array("Simple", "Sine", "Octo Sine", "Knives", "Power Orb", "Split Cannon", "Flamethrower", "Life Channel");
global.case_names = array("Front", "Front-Back", "Left-Right", "Circular-4", "Circular-6", "Circular-8", "Orbital-5", "Scatter", "Split");
global.mv_names = array("Linear", "Loop Alt");
global.bt_names = array("Basic", "Flame");
global.ex_names = array("None", "Flame", "Lifesteal");

enum focus_list {
	basic,
	time_slow,
	shield
}
global.focus = focus_list.basic;
global.focus_inv = array(focus_list.basic, focus_list.time_slow, focus_list.shield);
global.focus_names = array("None", "Time Slow", "Shield");
tscd = 0;
tslim = 90;
shcd = 180;
fshbr = false;

knife_flg = false;

global.broom_x1 = 0;
global.broom_x2 = 0;
global.broom_y1 = 0;
global.broom_y2 = 0;