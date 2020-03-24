/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var ptheta = point_direction(x, y, obj_player.x, obj_player.y)*pi/180;
var dis = dist_to_player();
var xx = x + .7*dis*cos(ptheta);
var yy = y - .7*dis*sin(ptheta);

clay = 0;
spawn_line(5, x + r*cos(ptheta+pi/2), y - r*sin(ptheta+pi/2), obj_tutorial_enemy_split_card, id, ptheta, 140, 0, 1, xx, yy);
clay++;
spawn_line(5, x + r*cos(ptheta-pi/2), y - r*sin(ptheta-pi/2), obj_tutorial_enemy_split_card, id, ptheta, 140, 0, 1, xx, yy);

if(hp <= 0) instance_destroy();