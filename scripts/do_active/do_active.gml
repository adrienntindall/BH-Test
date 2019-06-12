///do_active()
for(var c = 0; c < array_length_1d(global.active_eq); c++) {
	switch(global.active_eq[c]) {
		case active.clear:
			if(!instance_exists(obj_clear)) instance_create_depth(x, y, 1, obj_clear);
			break;
		case active.lanturn:
			if(!instance_exists(obj_lanturn)) instance_create_depth(x, y, 1, obj_lanturn);
			break;
		case active.freezer:
			if(!instance_exists(obj_freezer_blaster)) instance_create_depth(x, y, 1, obj_freezer_blaster);
			break;
		case active.psn_cld:
			if(!instance_exists(obj_poison_cloud)) instance_create_depth(x, y, 1, obj_poison_cloud);
			break;
		case -1:
			break;
		default:
			show_debug_message("Note: active in slot " + string(c) + " is not defined");
			break;
	}
}