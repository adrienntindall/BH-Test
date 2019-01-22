/// @description Insert description here
// You can write your code in this editor
if(findIndex(global.weapon_inv, contents) == -1) {
	global.weapon_inv[array_length_1d(global.weapon_inv)] = contents;
}
else {
	obj_player.bombs++;	
}