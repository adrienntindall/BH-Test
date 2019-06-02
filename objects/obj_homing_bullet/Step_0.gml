/// @description Insert description here
// You can write your code in this editor
dt = global.dt;

if(target == -1) {
	target = instance_nearest(x, y, obj_enemy);	
}
image_angle = point_direction(x, y, target.x, target.y);	
theta = image_angle*pi/180;
spd = v;
move_linear();
