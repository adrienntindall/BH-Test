/// @description Set variables
// You can write your code in this editor
t = 0;

r = random(100) + 50;

hp = 5;

x0 = x;
y0 = y;

n = random(5) + 3;

dt = 1;

tilemap=layer_tilemap_get_id("Borders");

stile = tilemap_get_at_pixel("Tiles", x, y);
while(true) {
	if(tilemap_get_at_pixel("Tiles", bbox_left+r*cos(t/30), bbox_bottom+r*sin(t/30)) != stile
		|| tilemap_get_at_pixel("Tiles", bbox_left+r*cos(t/30), bbox_top+r*sin(t/30)) != stile
		|| tilemap_get_at_pixel("Tiles", bbox_right+r*cos(t/30), bbox_bottom+r*sin(t/30)) != stile
		|| tilemap_get_at_pixel("Tiles", bbox_right+r*cos(t/30), bbox_top+r*sin(t/30)) != stile) {
		t++;
		continue;
	}
	else if(t == 190) instance_destroy();
	break;
}