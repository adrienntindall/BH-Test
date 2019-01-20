/// @description Insert description here
// You can write your code in this editor

with(obj_bullet) {
	if (collision_line(other.xcorn1, other.ycorn1, other.xcorn1, other.ycorn2, id, 0, 0) || collision_line(other.xcorn2, other.ycorn2, other.xcorn2, other.ycorn1, id, 0, 0)) {
		theta = pi-theta;
		image_angle = 180-image_angle;	
	}
	else if (collision_line(other.xcorn1, other.ycorn1, other.xcorn2, other.ycorn1, id, 0, 0) || collision_line(other.xcorn2, other.ycorn2, other.xcorn1, other.ycorn2, id, 0, 0)) {
		theta *= -1;
		image_angle *= -1;	
	}
}

with(obj_bullet_enemy) {
	if (collision_line(other.xcorn1, other.ycorn1, other.xcorn1, other.ycorn2, id, 0, 0) || collision_line(other.xcorn2, other.ycorn2, other.xcorn2, other.ycorn1, id, 0, 0)) {
		theta = pi-theta;
		image_angle = 180-image_angle;	
	}
	else if (collision_line(other.xcorn1, other.ycorn1, other.xcorn2, other.ycorn1, id, 0, 0) || collision_line(other.xcorn2, other.ycorn2, other.xcorn1, other.ycorn2, id, 0, 0)) {
		theta *= -1;
		image_angle *= -1;	
	}
}