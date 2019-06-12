/// @description Insert description here
// You can write your code in this editor
dt = global.dt;

if(target == -1) {
	target = instance_nearest(x, y, obj_enemy);	
}
if(instance_exists(target)) { image_angle = point_direction(x, y, target.x, target.y); emer = false; }
else if(!emer) { theta = random(2*pi); emer = true; }
theta = image_angle*pi/180;
spd = v;
move_linear();
