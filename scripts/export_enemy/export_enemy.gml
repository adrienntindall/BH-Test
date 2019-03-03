///export_enemy() 

var name = "obj_enemy_" + rand_string(6);
var folder = "./" + name + "/";

var step = file_text_open_write(working_directory + folder + "Step_0.gml");

file_text_write_string(step, "///Enemy " + name + " Step Function\n\n");

var layers = max(1, floor(obj_pattern_viewer.vars[po.max_lay, 0]));

var cdv_arr = "";
for(var c = 0; c < layers; c++) {
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
	if(c == obj_pattern_viewer.layers-1) cdv_arr += "0";
	else cdv_arr += "0,";
}

file_text_close(step);

var create = file_text_open_write(working_directory + folder + "Create_0.gml");

file_text_write_string(create, @"///Enemy " + name + @" Create
event_inherited();
spd = " + string(vars[po.en_spd, 0]) + @";
a = " + string(vars[po.en_a, 0]) + @";
r = " + string(vars[po.en_r, 0]) + @";
cdv = array(" + cdv_arr + @");
");

file_text_close(create);

var object = file_text_open_write(working_directory + folder + name + ".yy");

var oid = rand_id();

file_text_write_string(object, "{" +
    "\"id\": \"" + oid + "\", \n" +
    "\"modelName\": \"GMObject\",\n" +
    "\"mvc\": \"1.0\",\n" +
    "\"name\": \"obj_enemy_circle\",\n" +
    "\"eventList\": [\n" +
        "{\n" +
            "\"id\": \"" + rand_id() + "\",\n" +
            "\"modelName\": \"GMEvent\",\n" +
            "\"mvc\": \"1.0\",\n" +
            "\"IsDnD\": false,\n" +
            "\"collisionObjectId\": \"00000000-0000-0000-0000-000000000000\",\n" +
            "\"enumb\": 0,\n" +
            "\"eventtype\": 3,\n" +
            "\"m_owner\": \"" + oid + "\"\n" +
        @"},
        {
		" + 
            "\"id\": \"" + rand_id() + "\",\n" +
            "\"modelName\": \"GMEvent\",\n" +
            "\"mvc\": \"1.0\",\n" +
            "\"IsDnD\": false,\n" +
            "\"collisionObjectId\": \"00000000-0000-0000-0000-000000000000\",\n" +
            "\"enumb\": 0,\n" +
            "\"eventtype\": 0,\n" +
            "\"m_owner\": \"" + oid + "\"\n" +
        @"}
    ],
	" +
    "\"maskSpriteId\": \"00000000-0000-0000-0000-000000000000\",\n" +
    "\"overriddenProperties\": null,\n" +
    "\"parentObjectId\": \"dfce6f12-5bf6-412b-9c01-e1530b8c725d\",\n" +
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
    "\"spriteId\": \"f28982fd-226e-4702-aa06-ce746cd68987\",\n" +
    "\"visible\": true\n" +
"}");

file_text_close(object);