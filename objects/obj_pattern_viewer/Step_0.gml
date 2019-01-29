/// @description Insert description here
// You can write your code in this editor

update = keyboard_check_pressed(vk_enter);

if(chng) {
	if(instance_exists(obj_type_box)) with(obj_type_box) instance_destroy();
	for(var c = 0; c < min(max_box, array_length_1d(var_ops)-cur_window*max_box); c++) {
		var box = instance_create_depth(10, 128+c*ydis, 0, obj_type_box);
		box.box_num = var_ops[cur_window*max_box + c];
	}
	chng = false;	
}

if(update) {
	if(instance_exists(obj_pattern_enemy)) with(obj_pattern_enemy) instance_destroy();
	if(instance_exists(obj_pattern_bullet)) with(obj_pattern_bullet) instance_destroy();
	var e = instance_create_depth(room_width/2, room_height/2, 1, obj_pattern_enemy);
	e.cdv = vars[po.cd];
	e.n = vars[po.sp_n];
	e.theta0 = vars[po.sp_theta];
	e.theta = vars[po.sp_dtheta];
	e.sp_r = vars[po.sp_r];
	e.sp_x1 = vars[po.sp_x1];
	e.sp_x2 = vars[po.sp_x2];
	e.sp_y1 = vars[po.sp_y1];
	e.sp_y2 = vars[po.sp_y2];
	e.spd = vars[po.en_spd];
	e.a = vars[po.en_a];
	e.r = vars[po.en_r];
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
		vars[cur_box] = real(keyboard_string);
		break;
}

