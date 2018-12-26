/// @description Insert description here
// You can write your code in this editor

move_linear(spd, theta, tilemap);

life -= 1;
if (life <= 0) {
	instance_destroy();	
}