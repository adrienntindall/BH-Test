/// @description Insert description here
// You can write your code in this editor
var mclick = mouse_check_button_pressed(mb_left);
var mhold = mouse_check_button(mb_left);
curtm = layer_tilemap_get_id(lays_id);
curmp = layer_tilemap_get_id(layg_id);
if(mclick) {
	if((mouse_x > x) && (mouse_x < bbox_right) && (mouse_y > y) && (mouse_y < bbox_bottom)) {
		curx = floor(mouse_x/64);
		cury = floor(mouse_y/64);
		cur_tile = tilemap_get(curmp, curx/2, cury/2);
	}
}
else if(mhold) {
	if(mouse_x > bbox_right) tilemap_set_at_pixel(curtm, cur_tile, mouse_x, mouse_y);	
}

var save = keyboard_check(vk_control) && keyboard_key_press(ord("S"));
if(save) {
	
	
}