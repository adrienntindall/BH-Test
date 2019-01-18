randomize();

lay_id = layer_get_id("Tiles");
map_id = layer_tilemap_get_id(lay_id);
blay_id = layer_get_id("Borders");
bmap_id = layer_tilemap_get_id(blay_id);
border_tile = tilemap_get(bmap_id, 1, 1);
tilemap_set(bmap_id, 0, 1 ,1);
boss = obj_boss;
enemies[0] = obj_enemy;
enemies[1] = obj_enemy_ring;
broom_x1 = 0;
broom_x2 = room_width;
broom_y1 = 0;
broom_y2 = room_height;
sroom_x1 = 0;
sroom_x2 = 0;
sroom_y1 = 0;
sroom_y2 = 0;
broom_set = false;
broom_min_size = 5*5;

//Setting tiles (ho boi)
floor_tile = tilemap_get(map_id, 1, 1);
corn_ne = tilemap_get(map_id,0, 2);
corn_nw = tilemap_get(map_id,2, 2);
corn_se = tilemap_get(map_id,0, 0);
corn_sw = tilemap_get(map_id,2, 0);
wall_n = tilemap_get(map_id,1, 2);
wall_s = tilemap_get(map_id,1, 0);
wall_e = tilemap_get(map_id,0, 1);
wall_w = tilemap_get(map_id,2, 1);
wall_corn_ne = tilemap_get(map_id,4, 1);
wall_corn_nw = tilemap_get(map_id,3, 1);
wall_corn_se = tilemap_get(map_id,4, 2);
wall_corn_sw = tilemap_get(map_id,3, 2);
wall_corn_nse = tilemap_get(map_id,5, 2);
wall_corn_nsw = tilemap_get(map_id,5, 1);
wall_corn_ewn = tilemap_get(map_id,4, 0);
wall_corn_ews = tilemap_get(map_id,3, 0);
wall_nsew = tilemap_get(map_id,0, 3);
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
global.boss = boss;
obj_player.boss_defeated=false;