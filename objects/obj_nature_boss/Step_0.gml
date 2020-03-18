/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch(phase) {
	case 1:
		clay = 0;
		spawn_circular(20, x, y, obj_boss_spore, id, pi/40*t, 20, .05, false, false, false);
		clay++;
		spawn_circular(2, x + secr*cos(secth + pi/2), y - secr*sin(secth + pi/2), obj_boss_sec_bt, id, pi/1.5*t, 10, .075);
		clay++;
		spawn_circular(5, x + hourr*cos(hourth + pi/2), y - hourr*sin(hourth + pi/2), obj_boss_sec_bt, id, pi/sqrt(5)*t, 50, .35);
		clay++;
		spawn_circular(8, x + minr*cos(minth + pi/2), y - minr*sin(minth + pi/2), obj_boss_sec_bt, id, pi/sqrt(2)*t, 50, .5);
		break;
	case 2:
		clay = 10;
		spawn_circular(5, x + secr*cos(secth + pi/2), y - secr*sin(secth + pi/2), obj_boss_sec_bt, id, pi/sqrt(2)*t, 10, .075);
		clay++;
		spawn_circular(6, x + hourr*cos(hourth + pi/2), y - hourr*sin(hourth + pi/2), obj_boss_hour_bt, id, 0, 50, .9);
		clay++;
		spawn_circular(8, x + minr*cos(minth + pi/2), y - minr*sin(minth + pi/2), obj_boss_min_bt, id, pi/sqrt(3)*t, 50, .25);
		break;
	case 3:
		clay = 20;
		spawn_circular(20, x, y, obj_boss_spore, id, -pi/40*t, 20, .05, false, false, false);
		clay++;
		spawn_circular(2, x + secr*cos(secth + pi/2), y - secr*sin(secth + pi/2), obj_boss_min_bt, id, pi/1.5*t, 10, .075);
		clay++;
		spawn_circular(5, x + hourr*cos(hourth + pi/2), y - hourr*sin(hourth + pi/2), obj_boss_min_bt, id, pi/sqrt(5)*t, 50, .35);
		clay++;
		spawn_circular(8, x + minr*cos(minth + pi/2), y - minr*sin(minth + pi/2), obj_boss_min_bt, id, pi/sqrt(2)*t, 50, .5);
		break;
	case 4:
		clay = 30;
		spawn_circular(5, x + secr*cos(secth + pi/2), y - secr*sin(secth + pi/2), obj_boss_sec_bt, id, pi/sqrt(2)*t, 10, .075);
		clay++;
		spawn_circular(1, x + hourr*cos(hourth + pi/2), y - hourr*sin(hourth + pi/2), obj_boss_hour_bt, id, 0, 50, .15);
		clay++;
		spawn_circular(5, x + minr*cos(minth + pi/2), y - minr*sin(minth + pi/2), obj_boss_min_bt, id, pi/sqrt(5)*t, 50, .1);
		break;
	case 5:
		clay = 40;
		spawn_circular(20, x, y, obj_boss_spore, id, sin(pi*t/3)*pi/15, 20, .05, false, false, false);
		clay++;
		spawn_circular(2, x + secr*cos(secth + pi/2), y - secr*sin(secth + pi/2), obj_boss_sec_bt, id, pi/1.5*t, 10, .075);
		clay++;
		spawn_circular(5, x + hourr*cos(hourth + pi/2), y - hourr*sin(hourth + pi/2), obj_boss_sec_bt, id, pi/sqrt(5)*t, 50, .35);
		clay++;
		spawn_circular(8, x + minr*cos(minth + pi/2), y - minr*sin(minth + pi/2), obj_boss_min_bt, id, pi/sqrt(2)*t, 50, .5);
		break;
	default:
		break;
}

if(hp <= 0) {
	switch(phase) {
		case 1:
			hp = 15;
			t = 0;
			break;
		case 2:
			hp = 20;
			t = 0;
			break;
		case 3:
			hp = 15;
			hourth = 0;
			minth = 2*pi/3;
			secth = 4*pi/3;
			break;
		case 4:
			hp = 25;
			minth = 0;
			hourth = 0;
			secth = 0;
			break;
		default:
			with(obj_bullet_enemy) {
				instance_destroy();
			}
			instance_destroy();
			break;
	}
	phase++;
	t = 0;
	with(obj_bullet_enemy) {
		instance_destroy();
	}
	with(obj_graze_ball) {
		instance_destroy();
	}
}

t+=dt;