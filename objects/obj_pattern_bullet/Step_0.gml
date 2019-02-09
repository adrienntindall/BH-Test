/// @description Insert description here
// You can write your code in this editor

if(!init && (set || parent == obj_pattern_enemy.id)) {
	cdepth = parent.cdepth + 1;
	
	vars = (cdepth > 0) ? obj_pattern_viewer.splits : obj_pattern_viewer.vars;

	pattern = vars[po.bt_mov, l];

	x_egg = vars[po.x_ex, l];
	y_egg = vars[po.y_ex, l];
	x_disp = vars[po.x_disp, l];

	spd = vars[po.bt_spd, l];
	wspd = vars[po.bt_wspd, l];
	a = vars[po.bt_a, l];
	tspd = vars[po.bt_tspd, l];
	ta = vars[po.bt_ta, l];
	minspd = vars[po.bt_spd_min, l];
	maxspd = vars[po.bt_spd_max, l];

	tts = array(vars[po.bt_tts, l]);
	
	splits = vars[po.split_indx, l];
	sp_amt = vars[po.bt_split_amnt, l];
	
	sprite_index = obj_pattern_viewer.bt_sprs[vars[po.bt_spr, l]];
	
	vars = obj_pattern_viewer.splits;
}

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



for(var c = 0; c < sp_amt; c++;) {
	var s = splits[c];
	clay = c;
	if(tts[c] <= 0) {
		switch(vars[po.bt_spawn, s]) {
			case sp.arc_spread:
			spawn_arc_spread(vars[po.sp_n, s], obj_pattern_bullet, id, vars[po.sp_theta, s], vars[po.sp_dtheta], vars[po.sp_r, s], vars[po.cd, s]);
			break;
		case sp.arc_spray:
			spawn_arc_spray(n[c], obj_pattern_bullet, id, theta0[c], theta2[c], theta[c], sp_r[c], cdv[c]);
			break;
		case sp.circular:
			spawn_circular(vars[po.sp_n, s], obj_pattern_bullet, id, vars[po.sp_theta, s]+vars[po.sp_wspd, s]*t, vars[po.sp_r, s], vars[po.cd, s]);
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
		with(obj_pattern_bullet) {
			if(parent = other.id && !init) {
				clay = other.splits[c];
				set = true;	
			}
		}
	}
	tts[c] -= global.dt;
}

t += global.dt;