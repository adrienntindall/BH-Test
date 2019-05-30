/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

for(var c = 0; c < c_max[0]; c++) {
	if(active[c]) {
		burn_time[c] -= global.dt;
		if(burn_time[c] <= 0) {
			active[c] = false;
			repeat(2) {
				var gb = instance_create_depth(x, y, 1, obj_graze_ball_fire);
				gb.theta = random(2*pi);
				gb.a *= 2;
			}
			c_amnts[0]--;
		}
	}
}