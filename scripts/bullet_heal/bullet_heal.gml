///bullet_heal(amnt)
///@param amnt  amount healed
var amnt = argument0;
var i = id;

with(obj_bullet_enemy) {
	if(parent == i) {
		if(global.weapon != weapon_list.life_channel) && (global.weapon_alt != weapon_list.life_channel) obj_player.hp += amnt;
		instance_destroy();
	}
}