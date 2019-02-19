/// @description Insert description here
// You can write your code in this editor
if(obj_pattern_viewer.cur_depth == 0) {
	obj_pattern_viewer.vars[po.bt_mov, obj_pattern_viewer.cur_lay] += 1;
	if(obj_pattern_viewer.vars[po.bt_mov, obj_pattern_viewer.cur_lay] == mp.length) obj_pattern_viewer.vars[po.bt_mov, obj_pattern_viewer.cur_lay] = 0;
}
else {
	obj_pattern_viewer.splits[po.bt_mov, obj_pattern_viewer.cur_lay] += 1;
	if(obj_pattern_viewer.splits[po.bt_mov, obj_pattern_viewer.cur_lay] == mp.length) obj_pattern_viewer.splits[po.bt_mov, obj_pattern_viewer.cur_lay] = 0;	
}
obj_pattern_viewer.cur_window = 0;
obj_pattern_viewer.chng = true;