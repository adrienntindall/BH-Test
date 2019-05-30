/// @description Insert description here
// You can write your code in this editor
with(other) {
	var ex = findIndex(other.c_types, object_index);
	if(ex == -1) break;
	if(other.c_amnts[ex] < other.c_max[ex]) {
		other.c_amnts[ex]++;
		instance_destroy();
	}
	else {
		target = instance_nearest(x, y, obj_enemy);
	}
}