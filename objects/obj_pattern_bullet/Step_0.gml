/// @description Insert description here
// You can write your code in this editor

switch(pattern) {
	case mp.linear:
		move_linear();
		break;
	case mp.loop_alt:
		move_loop_alt(x_egg, x_disp, y_egg);
		break;
	case mp.loop_const:
		move_loop_const(x_egg, x_disp, y_egg);
		break;
	case mp.pulse:
		move_pulse(x_egg, x_disp); 
		break;
	default:
		show_debug_message("Note: the currently selected bullet pattern is not implemented in the bullet object");
		break;
}

if(tts < 0) {
		
}

tts -= global.dt;