/// @description Defining Variables
event_inherited();
cshape = shape.circle;
crad = 5;

depth = 2;
cd = array(0, 0);
kcd = .5;
lock = noone;
hp = 3;
maxhp = 3;
spd = 250;
fspd = 155;
qspd = 420;
t = 0;
dt = delta_time;
tilemap = layer_tilemap_get_id("Borders");
mask_index = spr_player_female;
boss_defeated = false;
kix = 0;
clay = 0;
grps = 900;
dt = 0;

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

enum passive {
	heat_smoke,
	incenerator,
	length
}
global.pass_eq = array(-1, -1, -1);
global.pass_own = array(-1);

enum active {
	clear,
	lanturn,
	freezer,
	psn_cld,
	length
}

//global.active_eq = array(active.clear, -1, -1, -1)
global.active_eq = array(active.freezer); //for testing
global.active_own = array(active.clear);

global.weapon = zeros_arr(8);

global.graze_bts = array(obj_graze_ball_neutral, obj_graze_ball_fire, obj_graze_ball_ice, obj_graze_ball_electric, obj_graze_ball_light, obj_graze_ball_nature);

enum focus_list {
	basic,
	time_slow,
	shield
}
global.focus = focus_list.basic;
global.focus_inv = array(focus_list.basic, focus_list.time_slow, focus_list.shield);
global.focus_names = array("None", "Time Slow", "Shield");
tscd = 0;
shcd = 180;
fshbr = false;

knife_flg = false;

global.broom_x1 = 0;
global.broom_x2 = 0;
global.broom_y1 = 0;
global.broom_y2 = 0;