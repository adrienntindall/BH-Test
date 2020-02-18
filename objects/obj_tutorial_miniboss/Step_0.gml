/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

clay = 0;

switch(phase) {
	case 1:
		clay = 0;
		spawn_circular(6, obj_tutorial_miniboss_lazer, id, .001*cur_bul[clay], 70, 0, true, false);
		clay++;
		spawn_circular(1, obj_tutorial_miniboss_fastone, id, pi/180*point_direction(x, y, obj_player.x, obj_player.y), 30, 1, false, false);
		clay++;
		break;
	case 2:
		clay = 2;
		var btarr = spawn_circular(6, obj_tutorial_miniboss_phase2_cluster, id, 0, 70, .75, true, false);
		if(laz_arr[clay] != -1) {
			for(var c = 0; c < array_length_1d(btarr); c++) {
				btarr[c].theta = point_direction(x, y, obj_player.x, obj_player.y)*pi/180;
			}
		}
		clay++;
		spawn_arc_spread(16, obj_tutorial_miniboss_phase2_backbt, id, point_direction(x, y, obj_player.x, obj_player.y)*pi/180 + pi/3, 4*pi/3, 100, .2, false);
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
			instance_destroy();
			break;
	}
}