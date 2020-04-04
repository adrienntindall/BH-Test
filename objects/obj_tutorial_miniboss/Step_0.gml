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
		spawn_circular(20, x, y, obj_tutorial_miniboss_phase2_backbt, id, ptheta, 80, 1.2);
		break;
	case 2:
		var ptheta = point_direction(x, y, obj_player.x, obj_player.y)*pi/180;
		clay = 2;
		for(var c = 0; c < 5; c++) {
			spawn_arc_spread(2, obj_tutorial_miniboss_bigcard, id, ptheta-pi/16, pi/8, 30, 1.2, false);
			clay++;
		}
	
		spawn_circular(16, x, y, obj_tutorial_miniboss_phase2_backbt, id, ptheta + pi/32, 100, .2);
		break;
	case 3:
		var ptheta = pi/180*point_direction(x, y, obj_player.x, obj_player.y);
		clay = 8;
		spawn_circular(6, x, y, obj_tutorial_boss_homing_card, id, pi/5*cur_bul[clay], 70, .6);
		clay++;
		spawn_circular(20, x, y, obj_tutorial_miniboss_phase2_backbt, id, ptheta, 80, 1);
		break;
	case 4:
		clay = 10;
		spawn_circular(6, x, y, obj_tutorial_boss_homing_card, id, pi/5*cur_bul[clay], 70, .8);
		clay++;
		spawn_circular(8, x, y, obj_tutorial_boss_hexagon_edge, id, pi/6 + pi/11*cur_bul[clay], 0, .75, false, false, false);
		break;
}

if(hp <= 0) {
	phase_time = def_phase_time;
	switch(phase) {
		case 1:
			hp = 40;
			max_hp = hp;
			phase_time = 60;
			phase++;
			break;
		case 2:
			hp = 40;
			max_hp = hp;
			phase++;
			break;
		case 3:
			hp = 40;
			max_hp = hp;
			phase_time = 40;
			phase++;
			break;
		case 4:
			instance_destroy();
			break;
	}
	audio_play_sound(snd_phase_shift, 1, false);
	audio_sound_gain(snd_phase_shift, .4, 0);
	with(obj_graze_ball) instance_destroy();
	with(obj_bullet_enemy) instance_destroy();
	surf_alpha = 0;
}

phase_time -= dt;
if(phase_time <= 0) {
	hp = 0;
}