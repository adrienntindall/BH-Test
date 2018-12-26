///bullet_heal(amnt, id)
//@param {real} amnt  amount healed
//@param {real} id  id of parent of bullet to destroy
var amnt = argument0;
var i = argument1;

with(obj_bullet_enemy) {
	if(parent = i) {
		obj_player.hp += amnt;
		instance_destroy();
	}
}