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
	if(!instance_exists(global.active_eq[c])) obj = instance_create_depth(x, y, 1, global.active_eq[c]);
	if(obj != -1) obj.release_btn = key;
}