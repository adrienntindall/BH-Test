/// @description Insert description here
// You can write your code in this editor

var dt = global.dt;

move_eq(3*sin(t0/10));

t++;
t0++;
life -= dt;
if (life <= 0) {
	instance_destroy();	
}