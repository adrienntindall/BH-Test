/// @description Defining Variables
event_inherited();

image_xscale = 1.2;
image_yscale = 1.2;

cshape = shape.circle;
crad = 5;

theta = 0;
depth = 2;
cd = array(0, 0);
kcd = .5;
runcd = .05;
hp = 8;
maxhp = 8;
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

enum active {
	clear,
	length
}

//global.active_eq = array(active.clear, -1, -1, -1)
global.active_eq = array(-1);
global.active_own = array(-1);

global.graze_bts = array(-1);