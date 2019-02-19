/// @description Insert description here
// You can write your code in this editor
draw_set_colour(c_black);
if(obj_pattern_viewer.cur_depth > 0)  {
	var sp_id = obj_pattern_viewer.cur_depth == 1 ? obj_pattern_viewer.vars[po.split_indx, obj_pattern_viewer.depth_path[obj_pattern_viewer.cur_depth-1]] : obj_pattern_viewer.splits[po.split_indx, obj_pattern_viewer.depth_path[obj_pattern_viewer.cur_depth-1]];
	draw_text(x+20, y+20, "Layer " + string(findIndex(sp_id, obj_pattern_viewer.cur_lay)));
}
else {
	draw_text(x+20, y+20, "Layer " + string(obj_pattern_viewer.cur_lay));
}
draw_self();