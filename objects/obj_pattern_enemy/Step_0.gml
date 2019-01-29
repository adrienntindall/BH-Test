/// @description Insert description here
// You can write your code in this editor
switch(mov_pat) {
	case em.still:
		break;
	case em.circle:
		enemy_move_circle();
		break;
	case em.chase:
		break;
	default:
		show_debug_message("Note: the currently selected enemy movement pattern has not been implemented in the enemy viewer");
		break;
}

switch(sp_pat) {
	case sp.arc_spread:
		spawn_arc_spread(n, obj_pattern_bullet, id, theta0, theta, sp_r, cdv);
		break;
	case sp.circular:
		spawn_circular(n, obj_pattern_bullet, id, theta0, sp_r, cdv);
		break;
	case sp.circular_spray:
		spawn_circular_spray(theta, obj_pattern_bullet, id, theta0, sp_r, cdv);
		break;
	case sp.line_spread:
		spawn_line_spread(n, obj_pattern_bullet, id, sp_x1, sp_y1, sp_x2, sp_y2,theta0, cdv);
		break;
	default:
		show_debug_message("Note: the currently selected bullet spawing pattern has not been implemented in the enemy viewer");
		break;
}