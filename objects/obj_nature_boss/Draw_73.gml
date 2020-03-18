/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

draw_sprite_ext(spr_second_hand, -1, x, y, 4, 4, secth*180/pi, c_white, 1);

draw_sprite_ext(spr_hour_hand, -1, x, y, 4, 4, hourth*180/pi, c_white, 1);

draw_sprite_ext(spr_minute_hand, -1, x, y, 2.25, 2.25, minth*180/pi, c_white, 1);

switch(phase) {
	case 1:
	case 2:
	case 3:
	case 5:
		secth -= pi*dt;
		hourth -= pi/10*dt;
		minth -= pi/5*dt;
		break;
	case 4:	
		secth -= pi/2.5*dt;
		hourth -= pi/2.5*dt;
		minth -= pi/2.5*dt;
		break;
}


draw_self();