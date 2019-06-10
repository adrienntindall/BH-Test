///graze(set_time)
///@param set_time
var dist = 0;
if(object_get_parent(object_index) != obj_laser_enemy) {
	var hr = (cshape == shape.circle) ? crad : hrad;
	var vr = (cshape == shape.circle) ? crad : vrad;
	var cx = min(abs(obj_player.x-obj_player.crad-(x+hr)),abs(obj_player.x+obj_player.crad-(x-hr)))-1;
	var cy = min(abs(obj_player.y-obj_player.crad-(y+vr)),abs(obj_player.y+obj_player.crad-(y-vr)))-1; 
	dist = cx*cx + cy*cy;
}
else {
	if(object_index == obj_laser_str_enemy) {
		with(obj_player) {
			dist = get_min_dist_linear(other) - crad - other.lrad;	
			dist *= dist;
		}
	}
}

if(instance_exists(parent) && parent.charged) {
	dist /= 1.2;
	dist /= parent.charge_mult;
	charge_mult = 1;
}

show_debug_message(string(dist));

if(argument0) grtime = dist/obj_player.grps;
else return dist/obj_player.grps;