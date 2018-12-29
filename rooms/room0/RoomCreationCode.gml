randomize();

lay_id = layer_get_id("Tiles");
map_id = layer_tilemap_get_id(lay_id);
floor_tile = tilemap_get(map_id, 1, 1);
blay_id = layer_get_id("Borders");
bmap_id = layer_tilemap_get_id(blay_id);
border_tile = tilemap_get(bmap_id, 1, 1);
tilemap_set(bmap_id, 0, 1 ,1);

generate_dungeon_layout(7, 0);

while(true) {
	var sx = random(room_width);
	var sy = random(room_height);
	if(!(tilemap_get_at_pixel(map_id, sx, sy) == floor_tile)) continue;
	else {
		obj_player.x = sx;
		obj_player.y = sy;
		break;
	}
}