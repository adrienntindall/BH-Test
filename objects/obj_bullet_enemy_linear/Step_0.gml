/// @description Insert description here
// You can write your code in this editor
image_blend = c_white;

event_inherited();

move_linear();

life -= dt;
if (life <= 0) {
	instance_destroy();
}

