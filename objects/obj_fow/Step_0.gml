/// @description Insert description here
// You can write your code in this editor

if((obj_player.x > bbox_left) && (obj_player.x < bbox_right) 
	&& (obj_player.y > bbox_top) && (obj_player.y < bbox_bottom)) {
	if(fade == 0) instance_destroy();
	else {
		image_alpha -= (100/15);
		fade--;	
	}
}
else if(fade != 15) {
	if(fade == 0) instance_destroy();
	image_alpha -= (100/15);
	fade--;
}