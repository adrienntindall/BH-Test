/// @description Insert description here
// You can write your code in this editor
if(obj_pattern_viewer.cur_depth == 0 ? obj_pattern_viewer.vars[po.bt_split_amnt] > 0 : obj_pattern_viewer.splits[po.bt_split_amnt, obj_pattern_viewer.depth_path[array_length_1d(obj_pattern_viewer.depth_path)-1]] > 0) {
	obj_pattern_viewer.cur_depth += 1;
	var aa = obj_pattern_viewer.cur_depth == 0 ? obj_pattern_viewer.vars[po.split_indx, obj_pattern_viewer.cur_lay] : obj_pattern_viewer.splits[po.split_indx, obj_pattern_viewer.cur_lay]; 
	obj_pattern_viewer.depth_path = array_add(obj_pattern_viewer.depth_path, aa[0]);
	obj_pattern_viewer.cur_lay = 0;
}