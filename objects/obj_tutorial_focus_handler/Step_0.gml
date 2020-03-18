/// @description Insert description here
// You can write your code in this editor

for(var c = 1; c < layers; c++) {
	var temp = bullets[c];
	for(var q = 0; q < array_length_1d(temp); q++) {
		if(!instance_exists(temp[q])) continue;
		var theta = q*pi/(4*c);
		switch(c mod 2) {
			case 0:
				theta += tan_v/(c*drad)*t; 
				break;
			case 1:
				theta -= tan_v/(c*drad)*t;
				break;
		}
		temp[q].x = x + c*drad*cos(theta);
		temp[q].y = y + c*drad*sin(theta);
	}
}

t += global.dt;