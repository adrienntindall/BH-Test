///export_enemy() 

var name = "obj_enemy_" + rand_string(6);
var folder = "./" + name + "/";

var create = file_text_open_write(working_directory + folder + "Create_0.gml");

file_text_write_string(create, @"///Enemy " + name + @" Create
event_inherited();
spd = " + string(vars[po.en_spd, 0]) + @";
a = " + string(vars[po.en_a, 0]) + @";
r = " + string(vars[po.en_r, 0]) + @";
cdv = array(" + cdv_arr + @");
");

file_text_close(create);

var step = file_text_open_write(working_directory + folder + "Step_0.gml");

file_text_write_string(step, "///Enemy " + name + " Step Function\n\n");

for(var c = 0; c < obj_pattern_viewer.layers; c++) {
	var bt_name = "obj_bullet_"+rand_string(6);
	export_bullet(0, c, bt_name);
	switch(vars[po.bt_spawn, c]) {
		case sp.circular:
			file_text_write_string(step, "spawn_circular("+string(vars[po.sp_n, c])+", " + bt_name + ", id," + string(vars[po.sp_theta, c])+","+ string(vars[po.sp_dtheta, c]) + "," + string(vars[po.cd, c])+");");
			break;
		case sp.circular_spray:
			file_text_write_string(step, "spawn_circular_spray("+string(vars[po.sp_dtheta, c])+", " + bt_name + ", id," + string(vars[po.sp_theta, c]) + "," + string(vars[po.sp_r, c]) + "," + string(vars[po.cd, c]) + ");");
			break;
		case sp.arc_spread:
			file_text_write_string(step, "spawn_arc_spread(" + string(vars[po.sp_n, c]) + ", " + bt_name +", id," + string(vars[po.sp_theta, c]) + "," + string(vars[po.sp_dtheta, c]) + "," + string(vars[po.sp_r, c]) + "," + string(vars[po.cd, c]) + ");");
			break;
		case sp.line_spread:
			file_text_write_string(step, "spawn_line_spread(" + string(vars[po.sp_n, c]) + ", " + bt_name + ", id," + string(vars[po.sp_x1, c]) + "," + string(vars[po.sp_y1, c]) + "," + string(vars[po.sp_x2, c]) + "," + string(vars[po.sp_y2, c]) + "," + string(vars[po.sp_theta, c]) + "," + string(vars[po.cd, c]) +");");
			break;
		default:
			show_debug_message("Note: Currently selected spawn doesn't have an export");
			break;
		file_text_write_string(step, "\n");
	}
}

file_text_close(step);