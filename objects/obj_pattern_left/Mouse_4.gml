/// @description Insert description here
// You can write your code in this editor
if(obj_pattern_viewer.cur_window == 0) cur_window = floor(array_length_1d(obj_pattern_viewer.var_ops)/obj_pattern_viewer.max_box);
else obj_pattern_viewer.cur_window--;

obj_pattern_viewer.chng = true;