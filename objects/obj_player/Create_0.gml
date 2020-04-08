/// @description Defining Variables
event_inherited();

image_xscale = 3.6;
image_yscale = 3.6;
image_speed = 0;

cshape = shape.circle;
crad = 4;

theta = 0;
depth = 2;
cd = array(0, 0);
kcd = .5;
runcd = .05;
hp = 7;
maxhp = 7;
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
inv_time = .5;
invcd = 0;
invincible=false;

f_time = 1/15;
ff_time = 1/10;
cur_f_time = 0;

global.active_eq = array(-1);
global.active_own = array(-1);

global.graze_bts = array(-1);