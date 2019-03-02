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

file_text_write_string(step, "///Bullet " + name + " Step Function\n \n");

switch(vrs[po.bt_mov, lay]) {
	case mp.linear:
		file_text_write_string(step, "move_linear();\n");
		break;
	case mp.loop_const:
		file_text_write_string(step, "move_loop_const("+string(vrs[po.x_ex, lay])+","+string(vrs[po.x_disp, lay])+","+string(vrs[po.y_ex, lay])+");\n");
		break;
	case mp.loop_alt:
		file_text_write_string(step, "move_loop_alt("+string(vrs[po.x_ex, lay])+","+string(vrs[po.x_disp, lay])+","+string(vrs[po.y_ex, lay])+");\n");	
		break;
	case mp.pulse:
		file_text_write_string(step, "move_pulse(" + string(vrs[po.x_ex, lay]) + "," + string(vrs[po.x_disp, lay])+");\n");
	default:
		show_debug_message("Note: Currently selected bullet movement doesn't have an export");
		break;
}

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

var object = file_text_open_write(working_directory + "./"+name+"/"+name+".yy");

var oid = rand_id();

file_text_write_string(object, "{ \n" + 
	"\"id\": \"" + oid + "\",\n" +
    "\"modelName\": \"GMObject\", \n" +
    "\"mvc\": \"1.0\", \n" + 
    "\"name\": \"" + name + "\", \n" +
    "\"eventList\": [ \n" + 
        "{\n" +
            "\"id\": \"" + rand_id() + "\", \n" + 
            "\"modelName\": \"GMEvent\", \n" +
            "\"mvc\": \"1.0\", \n" + 
            "\"IsDnD\": false, \n" +
            "\"collisionObjectId\": \"00000000-0000-0000-0000-000000000000\", \n" +
            "\"enumb\": 0, \n" +
            "\"eventtype\": 3, \n" +
            "\"m_owner\": \"" + oid + "\" \n" +
        @"},
        {" +
            "\"id\": \"" + rand_id() + "\", \n" +
            "\"modelName\": \"GMEvent\", \n" +
            "\"mvc\": \"1.0\",\n" +
            "\"IsDnD\": false,\n" +
            "\"collisionObjectId\": \"00000000-0000-0000-0000-000000000000\",\n" +
            "\"enumb\": 0,\n" +
            "\"eventtype\": 0,\n" +
            "\"m_owner\": \"" + oid + "\"\n" +
        @"},
        {" + 
            "\"id\": \"" + rand_id() + "\",\n" +
            "\"modelName\": \"GMEvent\",\n" +
            "\"mvc\": \"1.0\",\n" +
            "\"IsDnD\": false,\n" +
            "\"collisionObjectId\": \"85ce0113-d8ab-41f6-98af-d11b88d00ecf\",\n" +
            "\"enumb\": 0,\n" +
            "\"eventtype\": 4,\n" +
            "\"m_owner\": \"" + oid + "\"\n" +
        @"}
    ]," + 
    "\"maskSpriteId\": \"00000000-0000-0000-0000-000000000000\",\n" +
    "\"overriddenProperties\": null,\n" +
    "\"parentObjectId\": \"0f1223b0-2681-42c3-b82a-96ee43a21135\",\n" +
    "\"persistent\": false,\n" +
    "\"physicsAngularDamping\": 0.1,\n" +
    "\"physicsDensity\": 0.5,\n" +
    "\"physicsFriction\": 0.2,\n" +
    "\"physicsGroup\": 0,\n" +
    "\"physicsKinematic\": false,\n" +
    "\"physicsLinearDamping\": 0.1,\n" +
    "\"physicsObject\": false,\n" +
    "\"physicsRestitution\": 0.1,\n" +
    "\"physicsSensor\": false,\n" +
    "\"physicsShape\": 1,\n" +
    "\"physicsShapePoints\": null,\n" +
    "\"physicsStartAwake\": true,\n" +
    "\"properties\": null,\n" +
    "\"solid\": false,\n" +
    "\"spriteId\": \""+ string(obj_pattern_viewer.bt_sprs[vrs[po.bt_spr, lay]]) + "\",\n" +
    "\"visible\": true\n" +
"}");

file_text_close(object);