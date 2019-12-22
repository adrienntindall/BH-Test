///bullet_heal(amnt)
///@param amnt  amount healed
var amnt = argument0;
var i = id;

with(obj_bullet_enemy) {
	if(parent == i) {
		//if(global.weapon[3] != wp_ex.lifesteal) && (global.weapon[7] != wp_ex.lifesteal) obj_player.hp += amnt;
		instance_destroy();
	}
}