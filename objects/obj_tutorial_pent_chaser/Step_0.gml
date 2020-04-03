/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(dist_between(obj_player, self) > frad) following = true;
else following = false;

if(!following) {
	a = -90;
}
else {
	a = 15;
}
var theta = point_direction(x, y, obj_player.x, obj_player.y)*pi/180;
enemy_move_linear(theta);

spawn_circular(5, x, y, obj_tutorial_bt_spade, id, theta, 0, 1.5);

if(hp <= 0) instance_destroy();