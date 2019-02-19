/// @description Insert description here
// You can write your code in this editor
draw_sprite(obj_pattern_viewer.bt_sprs[obj_pattern_viewer.cur_depth == 0 ? obj_pattern_viewer.vars[po.bt_spr, obj_pattern_viewer.cur_lay] : obj_pattern_viewer.splits[po.bt_spr, obj_pattern_viewer.cur_lay]], -1, x+20, y+16);
draw_self();