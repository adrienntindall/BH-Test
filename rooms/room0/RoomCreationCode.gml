randomize();

lay_id = layer_get_id("Tiles");
map_id = layer_tilemap_get_id(lay_id);
floor_tile = tilemap_get(map_id, 1, 1);

generate_dungeon_layout(4, 0)