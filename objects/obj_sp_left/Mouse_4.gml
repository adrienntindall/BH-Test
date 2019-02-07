/// @description Insert description here
// You can write your code in this editor
obj_pattern_viewer.vars[po.bt_spawn, obj_pattern_viewer.cur_lay] -= 1;
if(obj_pattern_viewer.vars[po.bt_spawn, obj_pattern_viewer.cur_lay] < 0) obj_pattern_viewer.vars[po.bt_spawn, obj_pattern_viewer.cur_lay] = sp.length-1;
obj_pattern_viewer.cur_window = 0;
obj_pattern_viewer.chng = true;