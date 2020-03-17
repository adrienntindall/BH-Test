/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

image_blend = c_blue;

switch(phase) {
	case 1:
		move_linear();
		phase_time -= dt;
		if(phase_time <= 0) {
			phase = 2;
			a = 100;
			maxspd = 2000;
			spd = 0;
			defspd = 0;
			theta = point_direction(x, y, obj_player.x, obj_player.y)*pi/180;
			image_angle = point_direction(x, y, obj_player.x, obj_player.y);
		}
		break;
	case 2:
		move_linear();
		break;
}