/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(keyboard_check(release_btn) && !cld && c_amnts[0] >= 10 && c_amnts[1] >= 10) {
	c_amnts[0] -= 10;
	c_amnts[1] -= 10;
	cld = true;
	cx0 = obj_player.x;
	cy0 = obj_player.y;
}

if(cld) {
	with(obj_enemy) {
		if(dist_between_point(id, other.cx0, other.cy0) <= other.cld_rad) {
			hp -= other.dps*other.dt;	
		}
	}
	cld_life-=dt;
	if(cld_life <= 0) {
		cld = false
		cld_life = 5;	
	}
}
