/// @description Insert description here
// You can write your code in this editor
with(other) {
	instance_destroy();	
}
life--;
if(life == 0) {
	obj_player.fshbr = true;
	instance_destroy();	
}