///generate_dungeon_layout(splits, min_path_length)

var splits = argument0;
var mpl = argument1;

split_room(0, 0, floor(room_width/64), floor(room_height/64), splits);

for(var a = 0; a < floor(room_width/64); a++) {
	for(var b = 0; b < floor(room_height/64); b++) {
		if(tilemap_get(map_id, a, b) != floor_tile) {
			tilemap_set(bmap_id, border_tile, a, b);	
		}
	}
}