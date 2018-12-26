/// @description Insert description here
// You can write your code in this editor



if(hp <= 0) {
	var i = id;
	with(obj_bullet_enemy) {
		if(parent == i) {
			obj_player.hp += .01;
			instance_destroy();	
		}
	}
	instance_destroy();
}

x = x0 + 150*sin(t/40);

if(hp < 125) image_angle = (image_angle + 1) % 360;

if(t % 60 == 0 && hp > 124) {
	spawn_circular(x, y, 16, obj_bullet_enemy, id);
}
else if (hp < 125 && t %40 == 0) {
	for(c = 0; c < 16; c++) {
		b = instance_create_depth(x,y,0,obj_bullet_enemy);
		b.direction = (45*c/2 + image_angle) % 360;
		b.image_angle = (45*c/2 + image_angle) % 360;
		b.theta = b.image_angle*pi/180;
		b.parent = id;
	}
}
t++;