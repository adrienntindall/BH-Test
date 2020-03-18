/// @description Defining Variables
event_inherited();
cshape = shape.circle;
crad = 5;

depth = 2;
cd = array(0, 0);
kcd = .5;
hp = 25;
maxhp = 12;
spd = 250*image_xscale;
fspd = 155*image_xscale;
qspd = 420*image_xscale;
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
global.active_eq = array(-1);
global.active_own = array(-1);

global.graze_bts = array(-1);