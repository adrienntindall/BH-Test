/// @description Insert description here
// You can write your code in this editor
with(other) {
	hp-=other.dmg;
	stuned = true;
	stun_time = 1;
	slow = true;
	slowtime = 1;
}
instance_destroy();