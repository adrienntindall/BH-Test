/// @description Insert description here
// You can write your code in this editor
dt = global.dt;

if(on_fire) {
	hp -= dt*flame_dmg;
	flame_time -= dt;
	if(flame_time <= 0) {
		on_fire = false;
		flame_dmg = 0;
	}
}

if(slow) {
	dt *= .75;
	if(!stuned) slowtime -= dt;
	if(slowtime<=0) slow=false;
}

if(charged) charged_time -= dt;

if(stuned) {
	stun_time -= dt;
	if(stun_time <= 0) {
		stuned = false;
		stun_time = 0;
	}
	dt = 0;
}