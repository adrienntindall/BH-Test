///define_transition(in_dir, destination, link_id)
///@param in_dir
///@param dest
///@param link_id

dir = argument0;
r_dest = argument1;
trans_id = argument2;

define_rectangle();

centerx = bbox_left + (bbox_right-bbox_left)/2;
centery = bbox_top + (bbox_bottom-bbox_top)/2;