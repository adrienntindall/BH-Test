/// @description Insert description here
// You can write your code in this editor
if(obj_pattern_viewer.cur_depth == 0) {
	obj_pattern_viewer.cur_lay -= 1;
	if(obj_pattern_viewer.cur_lay < 0) obj_pattern_viewer.cur_lay = obj_pattern_viewer.layers - 1;
}
else {
	var sp_id = obj_pattern_viewer.cur_depth == 1 ? obj_pattern_viewer.vars[po.split_indx, obj_pattern_viewer.depth_path[obj_pattern_viewer.cur_depth-1]] : obj_pattern_viewer.splits[po.split_indx, obj_pattern_viewer.depth_path[obj_pattern_viewer.cur_depth-1]];
	
	if(findIndex(sp_id, obj_pattern_viewer.cur_lay) == 0) {
		obj_pattern_viewer.cur_lay = sp_id[array_length_1d(sp_id)-1];	
	}
	else {
		obj_pattern_viewer.cur_lay = sp_id[findIndex(sp_id, obj_pattern_viewer.cur_lay)-1];
	}
}
obj_pattern_viewer.cur_window = 0;
obj_pattern_viewer.chng = true;