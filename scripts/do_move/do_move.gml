///do_move(pat)
///@param mov_pat

switch(argument0) {
	case wp_mv.linear:
		spd = defspd;
		move_linear();
		break;
	default:
		show_debug_message("Note, bullet move pattern " + string(mov_pat) + " is not yet implemented");
		break;
}