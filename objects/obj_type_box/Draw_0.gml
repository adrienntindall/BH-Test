/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_font(menu_font);
draw_set_colour(c_black);
var data = obj_pattern_viewer.cur_depth > 0 ? obj_pattern_viewer.splits[box_num, obj_pattern_viewer.depth_path[obj_pattern_viewer.cur_depth]] : obj_pattern_viewer.vars[box_num, obj_pattern_viewer.cur_lay];
draw_text(x, y+sprite_height/2, string(data));