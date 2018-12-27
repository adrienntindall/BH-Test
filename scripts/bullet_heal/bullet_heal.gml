///bullet_heal(amnt)
//@param {real} amnt  amount healed
var amnt = argument0;
var i = id;

with(obj_bullet_enemy) {
	if(parent == i) {
		obj_player.hp += amnt;
		instance_destroy();
	}
}