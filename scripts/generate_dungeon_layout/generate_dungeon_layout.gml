///generate_dungeon_layout(splits, min_path_length)

var splits = argument0;
var mpl = argument1;

split_room(0, 0, floor(room_width/64), floor(room_height/64), splits);