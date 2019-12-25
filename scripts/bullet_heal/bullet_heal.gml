///bullet_heal(amnt)
///@param amnt  amount healed
var amnt = argument0;
var i = id;

with(obj_bullet_enemy) {
	if(parent == i) {
		instance_destroy();
	}
}