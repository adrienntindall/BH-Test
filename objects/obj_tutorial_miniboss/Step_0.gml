/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

clay = 0;

switch(phase) {
	case 1:
		var ptheta = pi/180*point_direction(x, y, obj_player.x, obj_player.y);
		clay = 0;
		spawn_circular(6, x, y, obj_tutorial_boss_homing_card, id, pi/5*cur_bul[clay], 70, .8);
		clay++;
		spawn_circular(1, x, y, obj_tutorial_miniboss_fastone, id, ptheta, 30, 2.5);
		clay++;
		spawn_circular(20, x, y, obj_tutorial_miniboss_phase2_backbt, id, ptheta, 80, 1.2);
		break;
	case 2:
	var ptheta = point_direction(x, y, obj_player.x, obj_player.y)*pi/180;
		clay = 3;
		var btarr = spawn_circular(6, x, y, obj_tutorial_miniboss_phase2_cluster, id, 0, 50, .8, true);
		if(btarr != -1) {
			for(var c = 0; c < array_length_1d(btarr); c++) {
				btarr[c].theta = ptheta;
			}
		}
		clay++;
		spawn_arc_spread(16, obj_tutorial_miniboss_phase2_backbt, id, ptheta + pi/3, 4*pi/3, 100, .2, false);
		break;
}

if(hp <= 0) {
	switch(phase) {
		case 1:
			hp = 40;
			phase++;
			with(obj_bullet_enemy) {
				instance_destroy();
			}
			break;
		case 2:
			//room_goto(room_tutorial5_bomb_reward);
			obj_room_transition.act = true;
			instance_destroy();
			break;
	}
	with(obj_graze_ball) instance_destroy();
}