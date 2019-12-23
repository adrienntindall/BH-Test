var c =  min(display_get_height()/720, display_get_width()/1280);
c*=7/8;
window_set_size(c*1280, c*720);

window_set_position((display_get_width()-c*1280)/2, (display_get_height()-c*720)/2); 
room_goto(room_tutorial2_focus);
randomize();

enum shape { //collision shapes
	circle,
	rectangle,
	length
}

lay_id = layer_get_id("Tiles");
map_id = layer_tilemap_get_id(lay_id);
blay_id = layer_get_id("Borders");
bmap_id = layer_tilemap_get_id(blay_id);
border_tile = tilemap_get(bmap_id, 1, 1);
tilemap_set(bmap_id, 0, 1 ,1);
broom_x1 = 0;
broom_x2 = room_width;
broom_y1 = 0;
broom_y2 = room_height;
sroom_x1 = 0;
sroom_x2 = 0;
sroom_y1 = 0;
sroom_y2 = 0;

//Setting tiles (ho boi)
floor_tile = 7;
corn_ne = 12;
corn_nw = 14;
corn_se = 5;
corn_sw = 2;
wall_n = 13;
wall_s = 1;
wall_e = 6;
wall_w = 8;
wall_corn_ne = 10;
wall_corn_nw = 9;
wall_corn_se = 16;
wall_corn_sw = 15;
wall_corn_nse = 17;
wall_corn_nsw = 11;
wall_corn_ewn = 4;
wall_corn_ews = 3;
wall_nsew = 18;
layers[0] = map_id;
layers[1] = layer_tilemap_get_id(layer_get_id("Tiles_2"));
layers[2] = layer_tilemap_get_id(layer_get_id("Tiles_3"));
layers[3] = layer_tilemap_get_id(layer_get_id("Tiles_4"));
for(var a = 0; a < 6; a++) for(var b = 0; b < 4; b++) tilemap_set(map_id, 0, a, b);

var size = 25;
room_height = size*64*4;
room_width = size*64*4;

generate_dungeon_layout(size, 3);

while(true) {
	var sx = random(sroom_x2-sroom_x1)+sroom_x1;
	var sy = random(sroom_y2-sroom_y1)+sroom_y1;
	if(tilemap_get_at_pixel(map_id, sx, sy) != floor_tile) continue;
	else if ((sx > broom_x1) && (sx < broom_x2) && (sy > broom_y1) && (sy < broom_y2)) continue;
	else {
		obj_player.x = sx;
		obj_player.y = sy;
		break;
	}
}

global.broom_x1 = broom_x1;
global.broom_x2 = broom_x2;
global.broom_y1 = broom_y1;
global.broom_y2 = broom_y2;
obj_player.boss_defeated=false;