/// @description Insert description here
// You can write your code in this editor
obj_pattern_viewer.cur_lay += 1;
if(obj_pattern_viewer.cur_lay == (obj_pattern_viewer.cur_depth > 0 ? 
								(obj_pattern_viewer.cur_depth == 1 ? 
									obj_pattern_viewer.vars[po.bt_split_amnt, obj_pattern_viewer.cur_lay]
									: obj_pattern_viewer.splits[po.bt_split_amnt, obj_pattern_viewer.depth_path[array_length_1d(obj_pattern_viewer.depth_path)-1]]) 
								: obj_pattern_viewer.layers)) obj_pattern_viewer.cur_lay = 0;
obj_pattern_viewer.cur_window = 0;
obj_pattern_viewer.chng = true;