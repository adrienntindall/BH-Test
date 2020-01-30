/// @description Insert description here
// You can write your code in this editor
if(mouse_check_button_pressed(mb_left) && 
	mouse_y >= y-ysize/2 && mouse_y <= y+ysize/2 &&
	((delta == -1 && mouse_x >= x-xsize && mouse_x <= x)||(delta == 1 && mouse_x >= x && mouse_x <= x+xsize))) {
	instance_destroy(input_box);
	switch(column) {
		case editor_column_type.spawn:
			obj_property_editor.cur_spawn = (obj_property_editor.cur_spawn + delta + spawn_op.length) mod spawn_op.length;
			break;
		case editor_column_type.pattern:
			obj_property_editor.cur_pattern = (obj_property_editor.cur_pattern + delta + pattern_op.length) mod pattern_op.length;
			break;
		case editor_column_type.path:
			obj_property_editor.cur_path = (obj_property_editor.cur_path + delta + path_op.length) mod path_op.length;
			break;
	}
}