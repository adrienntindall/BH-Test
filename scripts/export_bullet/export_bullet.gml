///export_bullet(depth, layer, name)
///@param depth
///@param layer
///@param name

var name = argument2;
var dpth = argument0;
var lay = argument1;

var vrs = (dpth > 0 ? global.vars : vars);

var create = file_text_open_write(working_directory + "./"+name+"/Create_0.gml");

file_text_write_string(create, "///Bullet " + name + @" Create Event \n
event_inherited();
spd = " + string(vrs[po.bt_spd, lay]) +@";
a = " + string(vrs[po.bt_a, lay]) +@";
tspd = " + string(vrs[po.bt_tspd, lay]) + @";
ta = " + string(vrs[po.bt_ta, lay]) + @";
minspd = " + string(vrs[po.bt_spd_min, lay]) +@";
maxspd = " + string(vrs[po.bt_spd_max, lay]) +@";
sprite_index = " +string(obj_pattern_viewer.bt_sprs[vrs[po.bt_spr, lay]]) + @";
mask_index = sprite_index;
"
)
file_text_close(create);

var step = file_text_open_write(working_directory + "./"+name+"/Step_0.gml");

file_text_write_string(step, "///Bullet " + name + " Step Function\n\n");

for(var c = 0; c < array_length_1d(vrs[po.split_indx, lay]); c++) {
	var bt_name = "obj_bullet_"+rand_string(6);
	var blay = vrs[po.split_indx, lay];
	blay = blay[c];
	export_bullet(dpth+1, blay, bt_name);
	switch(global.vars[po.bt_spawn, blay]) {
		case sp.circular:
			file_text_write_string(step, "spawn_circular("+string(global.vars[po.sp_n, blay])+", " + bt_name + ", id," + string(global.vars[po.sp_theta, blay])+","+ string(global.vars[po.sp_dtheta, blay]) + "," + string(global.vars[po.cd, blay])+");");
			break;
		case sp.circular_spray:
			file_text_write_string(step, "spawn_circular_spray("+string(global.vars[po.sp_dtheta, blay])+", " + bt_name + ", id," + string(global.vars[po.sp_theta, blay]) + "," + string(global.vars[po.sp_r, blay]) + "," + string(global.vars[po.cd, blay]) + ");");
			break;
		case sp.arc_spread:
			file_text_write_string(step, "spawn_arc_spread(" + string(global.vars[po.sp_n, blay]) + ", " + bt_name +", id," + string(global.vars[po.sp_theta, blay]) + "," + string(global.vars[po.sp_dtheta, blay]) + "," + string(global.vars[po.sp_r, blay]) + "," + string(global.vars[po.cd, blay]) + ");");
			break;
		case sp.line_spread:
			file_text_write_string(step, "spawn_line_spread(" + string(global.vars[po.sp_n, blay]) + ", " + bt_name + ", id," + string(global.vars[po.sp_x1, blay]) + "," + string(global.vars[po.sp_y1, blay]) + "," + string(global.vars[po.sp_x2, blay]) + "," + string(global.vars[po.sp_y2, blay]) + "," + string(global.vars[po.sp_theta, blay]) + "," + string(global.vars[po.cd, blay]) +");");
			break;
		default:
			show_debug_message("Note: Currently selected spawn doesn't have an export");
			break;
		file_text_write_string(step, "\n");
	}
}
file_text_close(step);