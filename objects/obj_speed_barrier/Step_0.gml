/// @description Insert description here
// You can write your code in this editor
with(obj_bullet) {
	if(is_inside(id, other.id)) {
		spd = spd*other.spd;
	}
}