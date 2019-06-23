/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(keyboard_check(release_btn) && !draw_ln && c_amnts[0] >= 5) {
	c_amnts[0]-=5;
	var c = chain-1;
	en = array(instance_nearest(x, y, obj_enemy));
	while(c > 0) {
		var n = 0;
		while(n < instance_number(obj_enemy)) {
			var obj = instance_nth_nearest(en[chain-c-1].x, en[chain-c-1].y, obj_enemy, n+1);
			if(dist_between(obj, en[chain-c-1]) <= chain_r) {
				en[chain-c] = obj;
				c--;
				break;
			}
			n++;
		}
		if(n == instance_number(obj_enemy)) break;
	}
	draw_ln = true;
}