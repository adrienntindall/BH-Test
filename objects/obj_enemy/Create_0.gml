/// @description Set variables
// You can write your code in this editor
t = 0;

r = random(100) + 50;

hp = 5;

x0 = x;
y0 = y;

n = random(5) + 3;

sdt = 1;
p1cd = 1.2;
p2cd = .7;

tilemap=layer_tilemap_get_id("Borders");

tm = layer_tilemap_get_id("Tiles");

stile = tilemap_get_at_pixel(tm, x, y);
while(true) {
	if(tilemap_get_at_pixel(tm, bbox_left+r*cos(t/30), bbox_bottom+r*sin(t/30)) != stile
		|| tilemap_get_at_pixel(tm, bbox_left+r*cos(t/30), bbox_top+r*sin(t/30)) != stile
		|| tilemap_get_at_pixel(tm, bbox_right+r*cos(t/30), bbox_bottom+r*sin(t/30)) != stile
		|| tilemap_get_at_pixel(tm, bbox_right+r*cos(t/30), bbox_top+r*sin(t/30)) != stile) {
		t++;
		continue;
	}
	else if(t == 190) instance_destroy();
	break;
}

rx1 = 0;
rx2 = 0;
ry1 = 0;
ry2 = 0;
fspd = 30;