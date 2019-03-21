/// @description Insert description here
// You can write your code in this editor
move_linear();

var dt = global.dt;

t++;
t0++;
life -= dt;
if (life <= 0) {
	instance_destroy();	
}