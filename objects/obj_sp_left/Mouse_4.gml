/// @description Insert description here
// You can write your code in this editor
var spl = obj_pattern_viewer.cur_depth > 0;
if(spl) obj_pattern_viewer.splits[po.bt_spawn, obj_pattern_viewer.cur_lay] -= 1;
else obj_pattern_viewer.vars[po.bt_spawn, obj_pattern_viewer.cur_lay] -= 1;
if((spl ? obj_pattern_viewer.splits[po.bt_spawn, obj_pattern_viewer.cur_lay] : obj_pattern_viewer.vars[po.bt_spawn, obj_pattern_viewer.cur_lay]) < 0) { 
	if(spl) obj_pattern_viewer.splits[po.bt_spawn, obj_pattern_viewer.cur_lay] = sp.length-1;
	else obj_pattern_viewer.vars[po.bt_spawn, obj_pattern_viewer.cur_lay] = sp.length-1;
}
obj_pattern_viewer.cur_window = 0;
obj_pattern_viewer.chng = true;