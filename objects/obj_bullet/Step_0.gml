/// @description Insert description here
// You can write your code in this editor
dt = global.dt;

t+=dt;
t0+=dt;
life -= dt;
if (life <= 0) {
	instance_destroy();	
}