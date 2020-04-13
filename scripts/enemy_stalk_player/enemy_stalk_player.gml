///enemy_stalk_player(rad, a_follow, a_back)
///@param rad
///@param a_fol
///@param a_back

var frad = argument0;
var af = argument1;
var ab = argument2;

var following = (dist_between(obj_player, self) > frad);

if(!following) {
	a = ab;
}
else {
	a = af;
}
var theta = point_direction(x, y, obj_player.x, obj_player.y)*pi/180;
enemy_move_linear(theta);