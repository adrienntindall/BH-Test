/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
with(other) {
	hp-=other.dmg;
}

obj_player.hp += dmg/(abs(x - obj_player.x));

instance_destroy();