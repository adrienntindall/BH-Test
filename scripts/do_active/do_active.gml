///do_active()
for(var c = 0; c < array_length_1d(global.active_eq); c++) {
	var key = -1;
	switch(c) {
		case 0:
			key = ord("X");
			break;
		case 1:
			key = ord("C");
			break;
		case 2:
			key = ord("V");
			break;
		case 3:
			key = vk_space;
			break;
	}
	var obj = -1;
	switch(global.active_eq[c]) {
		case active.clear:
			if(!instance_exists(obj_clear)) obj = instance_create_depth(x, y, 1, obj_clear);
			break;
		case active.lanturn:
			if(!instance_exists(obj_lanturn)) obj = instance_create_depth(x, y, 1, obj_lanturn);
			break;
		case active.freezer:
			if(!instance_exists(obj_freezer_blaster)) obj = instance_create_depth(x, y, 1, obj_freezer_blaster);
			break;
		case active.psn_cld:
			if(!instance_exists(obj_poison_cloud)) obj = instance_create_depth(x, y, 1, obj_poison_cloud);
			break;
		case active.lightning:
			if(!instance_exists(obj_lightning_orb)) obj = instance_create_depth(x, y, 1, obj_lightning_orb);
			break;
		case -1:
			break;
		default:
			show_debug_message("Note: active in slot " + string(c) + " is not defined");
			break;
	}
	if(obj != -1) obj.release_btn = key;
}