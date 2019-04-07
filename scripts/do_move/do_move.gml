///do_move(pat)
///@param mov_pat

switch(argument0) {
	case wp_mv.linear:
		spd = defspd;
		move_linear();
		break;
	case wp_mv.loop_alt:
		move_loop_alt(x_egg, x_disp, y_egg);
		break;
	default:
		show_debug_message("Note, bullet move pattern " + string(mov_pat) + " is not yet implemented");
		break;
}