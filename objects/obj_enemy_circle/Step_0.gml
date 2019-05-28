/// @description Insert description here
// You can write your code in this editor

var dt = global.dt;

if(hp <= 0) {
	bullet_heal(.002);
	instance_destroy();
}

enemy_chase_player();
enemy_move_circle();

if(hp >3 ? (p1cd <= 0):(p2cd <= 0)) {
	spawn_circular(n, obj_bullet_enemy_linear, id, 0, 10, hp > 3 ? 1.2 : .7);
	p1cd = 1.2;
	p2cd = .7;
}

p1cd-=dt;
p2cd-=dt;