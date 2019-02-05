/// @description Insert description here
// You can write your code in this editor
layers = 1;
cur_lay = 0;
update = true;
cur_box = -1;
cur_window = 0;
max_box = 4;
c_flag = false;
chng = true;
ydis = 256;

enum em {
	still,
	circle,
	chase,
	length
}

cur_mov = em.still;
em_op[em.still] = array(po.stillness, po.max_lay);
em_op[em.circle] = array(po.max_lay, po.en_w, po.en_wa, po.en_r);
em_op[em.chase] = array(po.max_lay, po.en_spd, po.en_a);
mov_names = array("Still", "Circular", "Chasing");

enum mp {
	linear,
	loop_const,
	loop_alt,
	length	
}

bt_mov[0] = mp.linear;
mp_op[mp.linear] = array(po.bt_spd, po.bt_a, po.bt_spd_min, po.bt_spd_max);
mp_op[mp.loop_const] = array(po.x_ex, po.x_disp, po.y_ex, po.bt_tspd, po.bt_ta);
mp_op[mp.loop_alt] = array(po.x_ex, po.x_disp, po.y_ex, po.bt_tspd, po.bt_ta);
mp_names = array("Linear", "Loop (constant)", "Loop (alternating)");

enum sp {
	circular,
	circular_spray,
	arc_spread,
	arc_spray,
	line_spread,
	length
}

bt_spawn[0] = sp.circular;
sp_op[sp.circular] = array(po.cd, po.sp_n, po.sp_theta, po.sp_r);
sp_op[sp.circular_spray] = array(po.cd, po.sp_dtheta, po.sp_theta, po.sp_r);
sp_op[sp.arc_spread] = array(po.cd, po.sp_dtheta, po.sp_theta, po.sp_n, po.sp_r);
sp_op[sp.arc_spray] = array(po.cd, po.sp_dtheta, po.sp_dtheta2, po.sp_theta, po.sp_n, po.sp_r);
sp_op[sp.line_spread] = array(po.cd, po.sp_n, po.sp_x1, po.sp_y1, po.sp_x2, po.sp_y2);
sp_names = array("Circular", "Circular (spray)", "Arc Spread", "Arc Spray", "Linear Spread");

enum po {
	stillness, //how still it is
	max_lay, //max amnt of layers
	cd, //cooldown
	rcd, //reset cooldown
	sp_n, //spawn n amnt
	sp_nmax, //max spawn amount (per pattern)
	sp_theta, //spawn theta offset
	sp_dtheta, //spawn delta theta
	sp_dtheta2, //spawn delta theta 2
	sp_r, //spawn radius
	sp_x1, //spawn x1 val
	sp_y1, //spawn y2 val
	sp_x2, //spawn x2 val
	sp_y2, //spawn y2 val
	x_ex, //move x exageration
	y_ex, //move y exageration
	x_disp, //move x displavement
	en_spd, //enemy speed
	en_a, //enemy acceleration
	en_r, //enemy radius
	en_w, //enemy rotational speed
	en_wa, //enemy rotational acceleration
	bt_spd, //bullet speed
	bt_a, //bullet acceleration
	bt_spd_min, //bullet min speed
	bt_spd_max, //bullet max speed
	bt_tspd, //bullet tick speed (multiplier)
	bt_ta, //bullet tick acceleration (multiplier)
	bt_life, //bullet life
	length
}

vars = 0;
for(var c = 0; c < po.length; c++) {
	vars[c, cur_lay] = 0;
}
vars[po.max_lay, 0] = 1;

var_names = array("Stillness:", "Layers: ", "Cooldown (sec): ", "Pattern reset time (sec):", "Bullet Amount: ", "Pattern Amount:", "Offset (rads): ", "dTheta (rads): ", "dTheta2 (rads):", "Spawn Radius: ",
				"Draw x1: ", "Draw y1: ", "Draw x2: ", "Draw y2: ", "X Exaggeration: ", "Y Exaggeration: ", "X displacement:", "Enemy Speed:",
				"Enemy Acceleration: ", "Enemy Radius: ", "Enemy Rotational Speed: ", "Enemy Rotational Acceleration: ",
				"Bullet Speed: ", "Bullet Acceleration: ", "Bullet Min. Speed: ", "Bullet Max. Speed: ", "Bullet tickspeed: ", "Bullet tickacceleration: ",
				"Bullet life (sec): ");

var_ops = array_add(em_op[cur_mov], array_add(sp_op[bt_spawn[0]], mp_op[bt_mov[0]]));

keyboard_string = "";