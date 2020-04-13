/// @description Insert description here
// You can write your code in this editor

if(other.charged) {
	open = true;
	image_blend = c_green;
	for(var c = 0.1; c < 5; c++) {
		tilemap_set(bmap_id, 0, x/64 + c*cos(image_angle*pi/180), y/64 - c*sin(image_angle*pi/180));
	}
}