/// @description Insert description here
// You can write your code in this editor
var dt = global.dt;

move_linear();

life -= dt;
if (life <= 0) {
	instance_destroy();	
}