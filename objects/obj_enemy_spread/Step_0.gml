/// @description Insert description here
// You can write your code in this editor

var dt = global.dt;

if(hp <= 0) {
	bullet_heal(.005);
	instance_destroy();
}

enemy_move_circle();

spawn_arc_spread(3, obj_bullet_enemy, id, n, 3*pi/4, .3);

n+=dt;
cd-=dt;