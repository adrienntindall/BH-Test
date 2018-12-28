/// @description Insert description here
// You can write your code in this editor
if(focus) {
	draw_set_color(c_purple);
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);	
}

draw_healthbar(x-30, y+30, x+30, y+35, hp/maxhp*100, c_purple, c_red, c_green, 0, false, true);