/// @description Insert description here
// You can write your code in this editor
obj_pattern_viewer.cur_depth -= 1;
if(obj_pattern_viewer.cur_depth < 0) obj_pattern_viewer.cur_depth = 0;
else {
	array_remove_index(obj_pattern_viewer.depth_path, array_length_1d(obj_pattern_viewer.depth_path)- 1);
	obj_pattern_viewer.cur_layer = obj_pattern_viewer.depth_path[array_length_1d(obj_pattern_viewer.depth_path) - 1];
}