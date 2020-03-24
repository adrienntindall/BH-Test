/// @description Insert description here
// You can write your code in this editor

if(act && r_dest != -1) {
	persistent = true;
	
	xoff = obj_player.x-bbox_left;

	room_goto(r_dest);

	x = -100;
	y = -100;

	panning = true;

}