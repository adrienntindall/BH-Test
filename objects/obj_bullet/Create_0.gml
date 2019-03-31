/// @description Insert description here
// You can write your code in this editor
life = 1.5;
spd = 450;
defspd = spd;
theta = 0;
t = 0;
t0 = 0;
x0 = x;
y0 = y;
tilemap = layer_tilemap_get_id("Borders");
parent = noone;
dmg = 1;
a = 0;
minspd = 0;
maxspd = 0;
cd = 0;
mov_pat = wp_mv.linear;
bt_aff = -1;

//Vars relating to knifeness + circular movement
is_knife = false;
index = 0;
r = 60;
maxd = 300;
defmaxd = maxd;
w = 8; //angular velocity
mode = 0; //0 = idle; 1 = active; 2 = return
icd = .5;