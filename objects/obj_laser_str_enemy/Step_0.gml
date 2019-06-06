/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(path_length != -1) {
	if(sprite_height*image_yscale <= path_length) {
		image_yscale += spd/sprite_height*dt;
		if(sprite_height*image_yscale > path_length) image_yscale = path_length/sprite_height;
	}
	else move_linear();
}
else {
	image_yscale += spd/sprite_height*dt;
}