randomize();

lay_id = layer_get_id("Tiles");
map_id = layer_tilemap_get_id(lay_id);
floor_tile = tilemap_get(map_id, 1, 1);
blay_id = layer_get_id("Borders");
bmap_id = layer_tilemap_get_id(blay_id);
border_tile = tilemap_get(bmap_id, 1, 1);
tilemap_set(bmap_id, 0, 1 ,1);
tilemap_set(map_id, 0, 1, 1);
boss = obj_boss;
enemies[0] = obj_enemy;
broom_x1 = 0;
broom_x2 = room_width;
broom_y1 = 0;
broom_y2 = room_height;
broom_set = false;
broom_min_size = 5*5;

generate_dungeon_layout(7, 0);

while(true) {
	var sx = random(room_width);
	var sy = random(room_height);
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