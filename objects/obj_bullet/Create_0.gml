/// @description Insert description here
// You can write your code in this editor
life = 1.5;
deflife = life;
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
cd[0] = 0;
mov_pat = wp_mv.linear;
bt_aff = -1;
ex_aff = -1;
x_egg = 40;
x_disp = 90;
y_egg = 50;
tspd = 1;
ta = 0;
dt = 0;

//Vars relating to knifeness + circular movement
r = 60;
maxd = 300;
defmaxd = maxd;
w = 8; //angular velocity
mode = 0; //0 = idle; 1 = active; 2 = return
clay = 0;

tx = 1;
ty = 1;
tx0 = 0;
ty0 = 0;
xacc_dis = 0;
yacc_dis = 0;

do_lifesteal = false;

isLazer = false;