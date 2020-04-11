/// @description Insert description here
// You can write your code in this editor

if(!open) {
	for(var c = 0; c < 5; c++) {
		tilemap_set(bmap_id, 1, x/64 + c*cos(image_angle*pi/180), y/64 - c*sin(image_angle*pi/180));
	}
}