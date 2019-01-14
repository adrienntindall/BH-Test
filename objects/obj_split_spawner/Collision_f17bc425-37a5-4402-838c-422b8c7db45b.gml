/// @description Insert description here
// You can write your code in this editor

with(other) {
	hp-=other.dmg;
}

for(var c = 0; c < 4; c++) {
	var so = instance_create_depth(x, y, 1, obj_split_orb);
	so.theta = theta + rot*c + pi/2;
}

instance_destroy();