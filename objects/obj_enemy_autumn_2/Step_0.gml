/// @description Insert description here
// You can write your code in this editor
if(hp <= 0) {
	bullet_heal(.001);
	instance_destroy();
}
spawn_circular_spray(pi/8, obj_bullet_leaf, id, 0, 20, .35);
