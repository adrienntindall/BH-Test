/// @description Insert description here
// You can write your code in this editor
vars = obj_pattern_viewer.vars;
var en_mov = "";
switch(mov_pat) {
	case em.still:
		break;
	case em.circle:
		en_mov = "enemy_move_circle();"
		break;
	case em.chase:
		show_debug_message("Note: Currently selected enemy move doesn't have an export");
		break;
}

var spawn  = "";
switch(obj_pattern_viewer.bt_spawn) {
	case sp.circular:
		spawn = "spawn_circular("+string(vars[po.sp_n])+", <bullet object>, id," + string(vars[po.sp_theta])+","+ string(vars[po.sp_dtheta]) + "," + string(vars[po.cd])+");";
		break;
	case sp.circular_spray:
		spawn = "spawn_circular_spray("+string(vars[po.sp_dtheta])+", <bullet object>, id," + string(vars[po.sp_theta]) + "," + string(vars[po.sp_r]) + "," + string(vars[po.cd]) + ");";
		break;
	case sp.arc_spread:
		spawn = "spawn_arc_spread(" + string(vars[po.sp_n]) + ", <bullet object>, id," + string(vars[po.sp_theta]) + "," + string(vars[po.sp_dtheta]) + "," + string(vars[po.sp_r]) + "," + string(vars[po.cd]) + ");";
		break;
	case sp.line_spread:
		spawn = "spawn_line_spread(" + string(vars[po.sp_n]) + ", <bullet object>, id," + string(vars[po.sp_x1]) + "," + string(vars[po.sp_y1]) + "," + string(vars[po.sp_x2]) + "," + string(vars[po.sp_y2]) + "," + string(vars[po.sp_theta]) + "," + string(vars[po.cd]) +");";
		break;
	default:
		show_debug_message("Note: Currently selected spawn doesn't have an export");
		break;
}

var mov = "";
switch(obj_pattern_viewer.bt_mov) {
	case mp.linear:
		mov = "move_linear();";
		break;
	case mp.loop_const:
		mov = "move_loop_const("+string(vars[po.x_ex])+","+string(vars[po.x_disp])+","+string(vars[po.y_ex])+");";
		break;
	case mp.loop_alt:
		mov = "move_loop_alt("+string(vars[po.x_ex])+","+string(vars[po.x_disp])+","+string(vars[po.y_ex])+");";	
		break;
	default:
		show_debug_message("Note: Currently selected bullet movement doesn't have an export");
		break;
}

file = file_text_open_write(working_directory+"exported_patterns.txt");
file_text_write_string(file, @"///Enemy Create
event_inherited();
spd = " + string(vars[po.en_spd]) + @"
a = " + string(vars[po.en_a]) + @"
r = " + string(vars[po.en_r]) + @"

///Enemy Step
"+en_mov+@"
"+spawn+@"

///Bullet Create
event_inherited();
spd = " + string(obj_pattern_viewer.vars[po.bt_spd]) +@";
a = " + string(obj_pattern_viewer.vars[po.bt_a]) +@";
tspd = " + string(vars[po.bt_tspd]) + @"
ta = " + string(vars[po.bt_ta]) + @"
minspd = " + string(obj_pattern_viewer.vars[po.bt_spd_min]) +@";
maxspd = " + string(obj_pattern_viewer.vars[po.bt_spd_max]) +@";

///Bullet Step
"+mov+@"
");
file_text_close(file);