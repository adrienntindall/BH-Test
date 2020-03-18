/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch(phase) {
	case 1:
		clay = 0;
		spawn_line(6, x + 20, y, obj_tutorial_boss_homing_card, id,  pi + pi/2*cur_bul[clay], 160, pi + pi/2*cur_bul[clay], 2);
		clay++;
		spawn_line(6, x + 20, y, obj_tutorial_boss_homing_card, id, pi/2*cur_bul[clay], 160, pi/2*cur_bul[clay], 2);
		clay++;
		spawn_circular(36, x, y, obj_tutorial_boss_circle_card, id, pi*dt/10, 80, 1.2);
		break;
	case 2:
		clay = 3;
		spawn_circular(6, x, y, obj_tutorial_boss_hexagon_corn, id, pi/13*cur_bul[clay], 0, .75, false, false, false);
		clay++;
		spawn_circular(6, x, y, obj_tutorial_boss_hexagon_edge, id, pi/6 + pi/11*cur_bul[clay], 0, .75, false, false, false);
		clay++;
		spawn_circular(30, x, y, obj_tutorial_boss_circle_card, id, pi/7*cur_bul[clay], 80, .2);
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
		default:
			instance_destroy();
			break;
	}
}