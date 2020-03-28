/// @description Set variables
// You can write your code in this editor
t = 0;
dt = 0;
clay = 0;
r = 0;

hp = 5;

x0 = x;
y0 = y;

n = 0;

sdt = floor(random(2)) ? -1 : 1;

tilemap=layer_tilemap_get_id("Borders");

tm = layer_tilemap_get_id("Tiles");

stile = tilemap_get_at_pixel(tm, x, y);

rx1 = 0;
rx2 = 0;
ry1 = 0;
ry2 = 0;
rn = 0;

fspd = 30;

cd[0] = 0;
cur_bul = 0;
cur_bul[0] = 0;
laz_arr = -1;
laz_arr[0] = -1;

on_fire = false;
flame_dmg = 1;
flame_time = 0;

slow = false;
slowtime = 0;

stuned = false;
stun_time = 0;

charged = false;
charged_time = 0;
charge_mult = 1;

w_spd = 0;

defspd = 0;

map_id = create_map_id(self);
if(ds_map_find_value(global.save_data, map_id) == false) instance_destroy();