/// @description Insert description here
// You can write your code in this editor

if((x-obj_player.x)*(x-obj_player.x) + (y-obj_player.y)*(y-obj_player.y) <= radius*radius) {
	select = keyboard_check_pressed(ord("E"));	
	image_index = 1;
}
else {
	select = false;
	image_index = 0;	
}