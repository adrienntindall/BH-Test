/// @description Insert description here
// You can write your code in this editor

drad = 90;

t = 0;

layers = 4;

tan_v = 45;

bullets = n1_arr(layers);

for(var c = 0; c < layers; c++) {
	var temp = n1_arr((c == 0 ? 1 : 8*c))
	for(var q = 0; q < array_length_1d(temp); q++) {
		var theta = (c == 0 ? 0 : q*pi/(4*c));
		temp[q] = instance_create_depth(x + c*drad*cos(theta), y + c*drad*sin(theta), 1, obj_tutorial_static_bt);
	}
	bullets[c] = temp;
}