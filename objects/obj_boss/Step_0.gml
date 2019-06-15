/// @description Insert description here
// You can write your code in this editor
event_inherited();

if(hp <= 0) {
	bullet_heal(.02);
	instance_destroy();
}

x = x0 + 150*sin(t);

if(hp < 125) image_angle = (image_angle + dt) % 360;

if(hp > 124) {
	clay = 0;
	spawn_circular(16, obj_bullet_enemy_linear, id, 0, 10, .7);
}
else if (hp < 125 && p2cd <= 0) {
	for(c = 0; c < 16; c++) {
		b = instance_create_depth(x,y,0,obj_bullet_enemy_linear);
		b.direction = (45*c/2 + image_angle) % 360;
		b.image_angle = (45*c/2 + image_angle) % 360;
		b.theta = b.image_angle*pi/180;
		b.parent = id;
		p2cd = .3;
	}
}
t+=dt;
p1cd-=dt;
p2cd-=dt;