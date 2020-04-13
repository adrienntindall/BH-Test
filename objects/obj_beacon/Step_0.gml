/// @description Insert description here
// You can write your code in this editor

var dt = global.dt;

if(charge == 0) {
	cur_t = max(0, cur_t-dt);
}
else {
	cur_t = min(t_max, cur_t+dt);
}

tan_v = max(0, max_tan_v*(-(cur_t-t_max)*(cur_t-t_max)/(t_max*t_max) + 1));
tan_v = min(tan_v, max_tan_v);

charge = max(0, charge-dt);

for(var c = 1; c < layers+1; c++) {
	var temp = bullets[c];
	for(var q = 0; q < array_length_1d(temp); q++) {
		switch(c mod 2) {
			case 0:
				temp[q].theta += tan_v/(c*drad)*dt; 
				break;
			case 1:
				temp[q].theta -= tan_v/(c*drad)*dt;
				break;
		}
		temp[q].x = x + c*drad*cos(temp[q].theta);
		temp[q].y = y + c*drad*sin(temp[q].theta);
		if(charge == 0) {
			temp[q].image_alpha = max(0, temp[q].image_alpha - dt*2);
		}
		else {
			temp[q].image_alpha = min(1, temp[q].image_alpha + dt*2);
		}
		temp[q].active = temp[q].image_alpha >= .7;
	}
}

t += global.dt;