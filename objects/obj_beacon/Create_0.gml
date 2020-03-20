/// @description Insert description here
// You can write your code in this editor
drad = 90;

t = 0;

layers = 3;

tan_v = 0;
max_tan_v = 120;

bullets = n1_arr(layers);

for(var c = 1; c < layers+1; c++) {
	var temp = n1_arr((c == 0 ? 1 : 8*c))
	for(var q = 0; q < array_length_1d(temp); q++) {
		var theta = (c == 0 ? 0 : q*pi/(4*c));
		temp[q] = instance_create_depth(x + c*drad*cos(theta), y + c*drad*sin(theta), 1, obj_electric_beacon_bt);
		temp[q].theta = q*pi/(4*c);
	}
	bullets[c] = temp;
}

charge = 5;

cur_t = 0;
t_max = 1;