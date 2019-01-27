/// @description Insert description here
// You can write your code in this editor

if(update) {
	if(instance_exists(obj_pattern_enemy)) with(obj_pattern_enemy) instance_destroy();
	if(instance_exists(obj_pattern_bullet)) with(obj_pattern_bullet) instance_destroy();
	e = instance_create_depth(room_width/2, room_height/2, 1, obj_pattern_enemy);
	e.cd = vars[po.cd];
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
}