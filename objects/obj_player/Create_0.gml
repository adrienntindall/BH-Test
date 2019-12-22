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
clay = 0;
grps = 900;
dt = 0;
inv_time = 1;
invcd = 0;
invincible=false;

enum active {
	clear,
	length
}

//global.active_eq = array(active.clear, -1, -1, -1)
global.active_eq = array(active.clear);
global.active_own = array(active.clear);

global.graze_bts = array(obj_graze_ball_neutral, obj_graze_ball_fire, obj_graze_ball_ice, obj_graze_ball_electric, obj_graze_ball_light, obj_graze_ball_nature);

global.broom_x1 = 0;
global.broom_x2 = 0;
global.broom_y1 = 0;
global.broom_y2 = 0;