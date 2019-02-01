/// @description Insert description here
// You can write your code in this editor
obj_pattern_viewer.cur_mov -= 1;
if(obj_pattern_viewer.cur_mov < 0) obj_pattern_viewer.cur_mov = em.length-1;
obj_pattern_viewer.cur_window = 0;
obj_pattern_viewer.chng = true;