/// @description Insert description here
// You can write your code in this editor
var dt = global.dt;

if(on_fire) {
	hp -= dt*flame_dmg;
	flame_time -= dt;
	if(flame_time <= 0) {
		on_fire = false;
		flame_dmg = 0;
	}
}

if(slow) {
	spd = defspd*.75;
	slowtime -= dt;
	if(slowtime<=0) slow=false;
}