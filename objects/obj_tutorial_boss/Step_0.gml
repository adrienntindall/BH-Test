/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch(phase) {
	case 1:
		var ptheta = point_direction(x, y, obj_player.x, obj_player.y)*pi/180;
		var r = 250;
		clay = 0;
		spawn_line(5, x + r*cos(ptheta+pi/2), y - r*sin(ptheta+pi/2), obj_tutorial_boss_homing_card, id, ptheta, 350, 0, 1, obj_player.x, obj_player.y);
		clay++;
		spawn_line(5, x + r*cos(ptheta-pi/2), y - r*sin(ptheta-pi/2), obj_tutorial_boss_homing_card, id, ptheta, 350, 0, 1, obj_player.x, obj_player.y);
		clay++;
		spawn_circular(6, x, y, obj_tutorial_boss_hexagon_edge, id, pi/6 + pi/11*cur_bul[clay], 0, .75, false, false, false);
		break;
	case 2:
		clay = 20;
		spawn_circular(6, x, y, obj_tutorial_boss_homing_card, id, pi/5*cur_bul[clay], 70, .6);
		clay++;
		spawn_circular(8, x, y, obj_tutorial_boss_hexagon_edge, id, pi/6 + pi/11*cur_bul[clay], 0, .7, false, false, false);
		clay++;
		spawn_circular(30, x, y, obj_tutorial_boss_circle_card, id, pi/7*cur_bul[clay], 80, .5);
		break;
	case 3:
		clay = 30;
		spawn_circular(6, x, y, obj_tutorial_boss_hexagon_corn, id, pi/sqrt(175)*cur_bul[clay], 0, .5, false, false, false);
		clay++;
		spawn_circular(6, x, y, obj_tutorial_boss_hexagon_edge, id, pi/6 - pi/sqrt(118)*cur_bul[clay], 0, .3, false, false, false);
		break;
	case 4:
		var ptheta = point_direction(x, y, obj_player.x, obj_player.y)*pi/180;
		clay = 40;
		spawn_circular(6, x, y, obj_tutorial_boss_hexagon_corn, id, pi/sqrt(175)*cur_bul[clay], 0, .1, false, false, false);
		clay++;
		spawn_arc_spread(4, obj_tutorial_bt_spade, id, ptheta - pi/3, 2*pi/3, 50, .6, false);
		clay++;
		spawn_arc_spread(5, obj_tutorial_bt_spade, id, ptheta - pi/3, 2*pi/3, 50, .6, false);
		break;
	case 5:
		clay = 50;
		spawn_circular(6, x, y, obj_tutorial_boss_hexagon_corn, id, pi/13*cur_bul[clay], 0, .75, false, false, false);
		clay++;
		spawn_circular(6, x, y, obj_tutorial_boss_hexagon_edge, id, pi/6 + pi/11*cur_bul[clay], 0, .75, false, false, false);
		clay++;
		spawn_circular(30, x, y, obj_tutorial_boss_circle_card, id, pi/7*cur_bul[clay], 80, .2);
		break;
	
}

if(hp <= 0) {
	hp = 40;
	max_hp = hp;
	phase_time = def_phase_time;
	switch(phase) {
		case 1:
			phase++;
			break;
		case 2:
			phase++;
			phase_time = 90;
			hp = 80;
			max_hp = 80;
			break;
		case 3:
			hp = 60;
			max_hp = hp;
			phase++;
			break;
		case 4:
			phase_time = 90;
			hp = 70;
			max_hp = hp;
			phase++;
			break;
		case 5:
		default:
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