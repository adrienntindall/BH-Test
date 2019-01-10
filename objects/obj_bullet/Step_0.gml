/// @description Insert description here
// You can write your code in this editor

//move_eq(5*sin(t0/10));
move_linear();

t++;
t0++;
life -= global.dt;
if (life <= 0) {
	instance_destroy();	
}