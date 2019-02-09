/// @description Insert description here
// You can write your code in this editor
obj_pattern_viewer.cur_box = box_num;
var data = obj_pattern_viewer.cur_depth > 0 ? obj_pattern_viewer.splits[box_num, obj_pattern_viewer.depth_path[obj_pattern_viewer.cur_depth]] : obj_pattern_viewer.vars[box_num, obj_pattern_viewer.cur_lay];
keyboard_string = string(data);
obj_pattern_viewer.c_flag = true;