/// @description Insert description here
// You can write your code in this editor

if(!init && (set || parent == obj_pattern_enemy.id)) {
	var vars = (cdepth > 0) ? obj_pattern_viewer.splits : obj_pattern_viewer.vars;

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
	
	splits = vars[po.split_indx, l];
	sp_amt = vars[po.bt_split_amnt, l];
	
	sprite_index = obj_pattern_viewer.bt_sprs[vars[po.bt_spr, l]];
	
	for(var c = 0; c < sp_amt; c++) {
		cd[c] = global.vars[po.cd, splits[c]];
	}
	
	init = true;
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
	switch(global.vars[po.bt_spawn, s]) {
		case sp.arc_spread:
		spawn_arc_spread(global.vars[po.sp_n, s], obj_pattern_bullet, id, global.vars[po.sp_theta, s], global.vars[po.sp_dtheta], global.vars[po.sp_r, s], global.vars[po.cd, s]);
		break;
	case sp.arc_spray:
		spawn_arc_spray(global.vars[po.sp_n, s], obj_pattern_bullet, id, global.vars[po.sp_theta, s], global.vars[po.sp_dtheta2, c], global.vars[po.sp_dtheta, s], global.vars[po.sp_r, s], global.vars[po.cd, s]);
		break;
	case sp.circular:
		spawn_circular(global.vars[po.sp_n, s], obj_pattern_bullet, id, global.vars[po.sp_theta, s]+global.vars[po.sp_wspd, s]*t, global.vars[po.sp_r, s], global.vars[po.cd, s]);
		break;
	case sp.circular_spray:
		spawn_circular_spray(global.vars[po.sp_dtheta, s], obj_pattern_bullet, id, global.vars[po.sp_theta, s], global.vars[po.sp_r, s], global.vars[po.cd, s]);
		break;
	case sp.line_spread:
		spawn_line_spread(global.vars[po.sp_n, s], obj_pattern_bullet, id, global.vars[po.sp_x1, s], global.vars[po.sp_y1, s], global.vars[po.sp_x2, s], global.vars[po.sp_y2, s], global.vars[po.sp_theta, s], global.vars[po.cd, s]);
		break;
	default:
		break;	
	}
	with(obj_pattern_bullet) {
		if(parent == other.id && !init && !set) {
			l = other.splits[c];
			set = true;	
			cdepth = other.cdepth+1;
		}
	}
}

t += global.dt;