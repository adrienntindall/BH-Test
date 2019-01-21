/// @description Set variables
// You can write your code in this editor
t = 0;

r = random(100) + 50;

hp = 5;

x0 = x;
y0 = y;

n = random(5) + 3;

sdt = floor(random(2)) ? -1 : 1;
p1cd = 1.2;
p2cd = .7;

tilemap=layer_tilemap_get_id("Borders");

tm = layer_tilemap_get_id("Tiles");

stile = tilemap_get_at_pixel(tm, x, y);
enemy_place_circle(tilemap);

rx1 = 0;
rx2 = 0;
ry1 = 0;
ry2 = 0;
rn = 0;

fspd = 30;

cd = 0;
cur_bul = 0;