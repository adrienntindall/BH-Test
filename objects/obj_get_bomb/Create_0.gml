/// @description Insert description here
// You can write your code in this editor
map_id = create_map_id(self);

if(ds_map_find_value(global.save_data, map_id) == false) instance_destroy();