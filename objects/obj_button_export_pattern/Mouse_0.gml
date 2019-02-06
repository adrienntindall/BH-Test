/// @description Insert description here
// You can write your code in this editor
vars = obj_pattern_viewer.vars;
var en_mov = "";
switch(obj_pattern_viewer.cur_mov) {
	case em.still:
		break;
	case em.circle:
		en_mov = "enemy_move_circle();"
		break;
	case em.chase:
		show_debug_message("Note: Currently selected enemy move doesn't have an export");
		break;
}

var cdv_arr = "";
var spawn  = "";
var mov = "";
var bt_create = "";
for(var c = 0; c < obj_pattern_viewer.layers; c++) {
	spawn += "clay = " + string(c) + ";\n";
	switch(obj_pattern_viewer.bt_spawn[c]) {
		case sp.circular:
			spawn += "spawn_circular("+string(vars[po.sp_n, c])+", <bullet object>, id," + string(vars[po.sp_theta, c])+","+ string(vars[po.sp_dtheta, c]) + "," + string(vars[po.cd, c])+");\n";
			break;
		case sp.circular_spray:
			spawn += "spawn_circular_spray("+string(vars[po.sp_dtheta, c])+", <bullet object>, id," + string(vars[po.sp_theta, c]) + "," + string(vars[po.sp_r, c]) + "," + string(vars[po.cd, c]) + ");\n";
			break;
		case sp.arc_spread:
			spawn += "spawn_arc_spread(" + string(vars[po.sp_n, c]) + ", <bullet object>, id," + string(vars[po.sp_theta, c]) + "," + string(vars[po.sp_dtheta, c]) + "," + string(vars[po.sp_r, c]) + "," + string(vars[po.cd, c]) + ");\n";
			break;
		case sp.line_spread:
			spawn += "spawn_line_spread(" + string(vars[po.sp_n, c]) + ", <bullet object>, id," + string(vars[po.sp_x1, c]) + "," + string(vars[po.sp_y1, c]) + "," + string(vars[po.sp_x2, c]) + "," + string(vars[po.sp_y2, c]) + "," + string(vars[po.sp_theta, c]) + "," + string(vars[po.cd, c]) +");\n";
			break;
		default:
			show_debug_message("Note: Currently selected spawn doesn't have an export");
			break;
	}
	
	mov += "///Bullet Step " + string(c) + "\n";
	switch(obj_pattern_viewer.bt_mov[c]) {
		case mp.linear:
			mov += "move_linear();\n";
			break;
		case mp.loop_const:
			mov += "move_loop_const("+string(vars[po.x_ex, c])+","+string(vars[po.x_disp, c])+","+string(vars[po.y_ex, c])+");\n";
			break;
		case mp.loop_alt:
			mov += "move_loop_alt("+string(vars[po.x_ex, c])+","+string(vars[po.x_disp, c])+","+string(vars[po.y_ex, c])+");\n";	
			break;
		default:
			show_debug_message("Note: Currently selected bullet movement doesn't have an export");
			break;
	}
	
	bt_create += @"///Bullet Create " + string(c) + @"
	event_inherited();
	spd = " + string(obj_pattern_viewer.vars[po.bt_spd, c]) +@";
	a = " + string(obj_pattern_viewer.vars[po.bt_a, c]) +@";
	tspd = " + string(vars[po.bt_tspd, c]) + @";
	ta = " + string(vars[po.bt_ta, c]) + @";
	minspd = " + string(obj_pattern_viewer.vars[po.bt_spd_min, c]) +@";
	maxspd = " + string(obj_pattern_viewer.vars[po.bt_spd_max, c]) +@";
	
	";

	if(c == obj_pattern_viewer.layers-1) cdv_arr += "0";
	else cdv_arr += "0,";
}

file = file_text_open_write(working_directory+"exported_patterns.txt");
file_text_write_string(file, @"///Enemy Create
event_inherited();
spd = " + string(vars[po.en_spd, 0]) + @";
a = " + string(vars[po.en_a, 0]) + @";
r = " + string(vars[po.en_r, 0]) + @";
cdv = array(" + cdv_arr + @");

///Enemy Step
"+en_mov+@"

"+spawn+@"

"+bt_create+@"

"+mov+@"
");
file_text_close(file);
