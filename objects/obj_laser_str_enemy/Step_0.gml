/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//theta = image_angle*pi/180;

with(obj_player) {
	var dis = get_min_dist_linear(other);
	if(dis < crad + other.lrad) {
		obj_player.hp--;
		show_debug_message(string(dis));
	}
}