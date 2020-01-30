/// @description Insert description here
// You can write your code in this editor

pattern = spawn_op.circular;
n = 2;
theta = 0;
rad = 0;
def_cd =  1;
cd = 0;
cd[0] = def_cd;
clay = 0;
t = 0;
dt = 0;
angle = 0;
dtheta = 0;
cur_bul = -1;
cur_bul[0] = 0;

bullet = instance_create_depth(x, y, 1, obj_pattern_bullet);
bullet.tag = true;
instance_deactivate_object(bullet);


path = path_op.static;

r = 0;
sdt = 1;
x0 = x;
y0 = y;
tilemap = layer_tilemap_get_id("Borders");