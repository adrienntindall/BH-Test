/// @description Insert description here
// You can write your code in this editor
if(!is_split_orb) {
	with(other) {
		hp-=other.dmg;
		hit_aff(other.ex_aff);
		hit_aff(other.bt_aff);
	}

	if(do_lifesteal) obj_player.hp += dmg/abs(1 + sqrt((x - obj_player.x)*(x - obj_player.x) + (y - obj_player.y)*(y - obj_player.y)));

	if(is_split_cannon) for(var c = 0; c < 4; c++) {
		var so = instance_copy(false);
		
		so.theta = theta + rot*c + pi/2;
		so.is_split_cannon = false;
		so.is_split_orb = true;
		so.prev_sprite = sprite_index;
		so.life = deflife;
		so.sprite_index = spr_bullet_enemy_ring;
	}

	if(!is_knife) instance_destroy();
	else mode = 2;
}