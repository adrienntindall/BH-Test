/// @description Insert description here
// You can write your code in this editor
if(array_length_1d(cd) < layers) {
	for(var c = 0; c < layers; c++) cd[c] = 0;
}

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
for(var c = 0; c < layers; c++) {
	clay = c;
	switch(sp_pat[c]) {
		case sp.arc_spread:
			spawn_arc_spread(n[c], obj_pattern_bullet, id, theta0[c], theta[c], sp_r[c], cdv[c]);
			break;
		case sp.arc_spray:
			spawn_arc_spray(n[c], obj_pattern_bullet, id, theta0[c], theta2[c], theta[c], sp_r[c], cdv[c]);
			break;
		case sp.circular:
			spawn_circular(n[c], obj_pattern_bullet, id, theta0[c], sp_r[c], cdv[c]);
			break;
		case sp.circular_spray:
			spawn_circular_spray(theta[c], obj_pattern_bullet, id, theta0[c], sp_r[c], cdv[c]);
			break;
		case sp.line_spread:
			spawn_line_spread(n[c], obj_pattern_bullet, id, sp_x1[c], sp_y1[c], sp_x2[c], sp_y2[c],theta0[c], cdv[c]);
			break;
		default:
			show_debug_message("Note: the currently selected bullet spawing pattern has not been implemented in the enemy viewer");
			break;
	}
}