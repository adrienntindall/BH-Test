/// @description Insert description here
// You can write your code in this editor

if(hp <= 0) {
	bullet_heal(.002);
	instance_destroy();
}

enemy_move_circle();

spawn_line_spread(3, obj_bullet_enemy, id, x+75*cos(n), y-75*sin(n), x-75*cos(n), y+75*sin(n), n+pi/2, .2);

n += global.dt;