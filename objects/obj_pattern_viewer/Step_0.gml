/// @description Insert description here
// You can write your code in this editor

update = keyboard_check_pressed(vk_enter);

if(array_length_2d(vars, 0) < layers) {
	for(var b = array_length_2d(vars, 0); b < layers; b++) 
		for(var c = 0; c < po.length; c++) {
			if(c >= po.en_spd && c <= po.en_wa) vars[c, b] = vars[c, 0];
			else if (c == po.max_lay) vars[c, b] = vars[c, 0];
			else vars[c, b] = 0;
		}
	bt_mov[b] = 0;
	bt_spawn[b] = 0;
}

if((cur_depth > 0) ? splits[po.bt_split_amnt, cur_lay] > array_length_1d(splits[po.split_indx, cur_lay])-1 : vars[po.bt_split_amnt, cur_lay] > array_length_1d(vars[po.split_indx, cur_lay])-1) {
	for(var c = (cur_depth > 0) ? array_length_1d(splits[po.split_indx, cur_lay])-1 : array_length_1d(vars[po.split_indx, cur_lay])-1;
		c < ((cur_depth > 0) ? splits[po.bt_split_amnt, cur_lay] : vars[po.bt_split_amnt, cur_lay]); c++) {
		if(cur_depth > 0) splits[po.split_indx, cur_lay] = array_add(splits[po.split_indx, cur_lay], array(array_length_2d(splits, 0)-1));
		else vars[po.split_indx, cur_lay] = array_add(vars[po.split_indx, cur_lay], array(array_length_2d(splits, 0)-1));
		
		for(var a = 0; a < po.length; a++) {
			splits[a, c] = 0;
			if(a == po.split_indx) splits[a, c] = array(0);
		}
		splits[po.max_lay, c] = cur_depth > 0 ? splits[po.bt_split_amnt, cur_lay] : vars[po.bt_split_amnt, cur_lay];
	
	}
}

if(chng) {
	var_ops = array_add(array_add(em_op[cur_mov], default_ops), array_add(sp_op[vars[po.bt_spawn, 0]], mp_op[vars[po.bt_mov, 0]]));
	if(instance_exists(obj_type_box)) with(obj_type_box) instance_destroy();
	for(var c = 0; c < min(max_box, array_length_1d(var_ops)-cur_window*max_box); c++) {
		var box = instance_create_depth(10, 128+c*ydis, 0, obj_type_box);
		box.box_num = var_ops[cur_window*max_box + c];
	}
	chng = false;
	cur_box = -1;
}

if(update) {
	if(instance_exists(obj_pattern_enemy)) with(obj_pattern_enemy) instance_destroy();
	if(instance_exists(obj_pattern_bullet)) with(obj_pattern_bullet) instance_destroy();
	var e = instance_create_depth(room_width/2, room_height/2, 1, obj_pattern_enemy);
	e.cdv = array_get_col(vars, po.cd);
	e.n = array_get_col(vars, po.sp_n);
	e.theta0 = array_get_col(vars, po.sp_theta);
	e.theta = array_get_col(vars, po.sp_dtheta);
	e.theta2 = array_get_col(vars, po.sp_dtheta2);
	e.sp_r = array_get_col(vars, po.sp_r);
	e.sp_x1 = array_get_col(vars, po.sp_x1);
	e.sp_x2 = array_get_col(vars, po.sp_x2);
	e.sp_y1 = array_get_col(vars, po.sp_y1);
	e.sp_y2 = array_get_col(vars, po.sp_y2);
	e.spd = vars[po.en_spd, 0];
	e.a = vars[po.en_a, 0];
	e.r = vars[po.en_r, 0];
	e.wspd = array_get_col(vars, po.sp_wspd);
	e.wa = array_get_col(vars, po.sp_wa);
	e.mov_pat = cur_mov;
	e.bt_pat = array_get_col(vars, po.bt_mov);
	e.sp_pat = array_get_col(vars, po.bt_spawn);
	e.layers = layers;
	update = false;
}

if(mouse_check_button_pressed(mb_left) && !c_flag) {
	cur_box = -1;
	keyboard_string = "";
}

switch(cur_box) {
	case -1:		
		break;
	default:
		with(obj_type_box) {
			if(other.cur_box == box_num) image_blend = c_ltgray;
			else image_blend = c_white;
		}
		if(cur_depth == 0) {
			vars[cur_box, cur_lay] = real(keyboard_string);
			layers = max(1, floor(vars[po.max_lay, 0]));
		}
		else {
			splits[cur_box, depth_path[cur_depth]] = real(keyboard_string);
			layers = max(1, floor(cur_depth == 1 ? vars[po.bt_split_amnt, depth_path[0]] : splits[po.bt_split_amnt, depth_path[cur_depth-1]]));	
		}
		break;
}
