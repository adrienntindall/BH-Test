/// @description Insert description here
// You can write your code in this editor
if(obj_pattern_viewer.cur_depth == 0) {
	obj_pattern_viewer.vars[po.bt_spr, obj_pattern_viewer.cur_lay] += 1;
	if(obj_pattern_viewer.vars[po.bt_spr, obj_pattern_viewer.cur_lay] == array_length_1d(obj_pattern_viewer.bt_sprs)) obj_pattern_viewer.vars[po.bt_spr, obj_pattern_viewer.cur_lay] = 0;
}
else {
	obj_pattern_viewer.splits[po.bt_spr, obj_pattern_viewer.cur_lay] += 1;
	if(obj_pattern_viewer.splits[po.bt_spr, obj_pattern_viewer.cur_lay] == array_length_1d(obj_pattern_viewer.bt_sprs)) obj_pattern_viewer.splits[po.bt_spr, obj_pattern_viewer.cur_lay] = 0;	
}