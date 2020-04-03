/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch(image_angle mod 180) {
	case 0:
		xrad = (bbox_right-bbox_left)/2;
		yrad = bbox_bottom-bbox_top;
		break;
	case 90:
		xrad = bbox_right-bbox_left;
		yrad = (bbox_bottom-bbox_top)/2;
		break;
}
ptheta = 0;

hp = 10;