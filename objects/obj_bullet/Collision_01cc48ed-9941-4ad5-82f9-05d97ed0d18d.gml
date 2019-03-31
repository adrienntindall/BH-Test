/// @description Insert description here
// You can write your code in this editor
with(other) {
	hp-=other.dmg;
}

if(!is_knife) instance_destroy();
else mode = 2;