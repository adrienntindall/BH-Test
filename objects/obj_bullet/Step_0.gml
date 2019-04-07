/// @description Insert description here
// You can write your code in this editor
var dt = global.dt;

if(is_knife) {
	if(mode == 0) {
		x0 = obj_player.x;
		y0 = obj_player.y;
	
		x = x0+r*cos(2*pi*t/w);
		y = y0+r*sin(2*pi*t/w);
	
		image_angle = point_direction(x0, y0, x, y);
	
		icd -= dt;
	}
	else if(mode == 1) {
		spd = defspd;
		if((x-x0)*(x-x0) + (y-y0)*(y-y0) < maxd*maxd) do_move(mov_pat);
		else  mode = 2;
	}
	if(mode == 2) {
		spd = defspd*.6;
		
		x0 = obj_player.x;
		y0 = obj_player.y;
	
		theta = point_direction(x, y, x0+r*cos(2*pi*t/w), y0+r*sin(2*pi*t/w))*pi/180;
	
		image_angle = theta*180/pi;
	
		move_linear();
	
		var tx = x0+r*cos(2*pi*t/w);
		var ty = y0+r*sin(2*pi*t/w);
		var dx = dt*spd*cos(theta);
		var dy = -dt*spd*sin(theta);
		var sx = x > tx;
		var sy = y > ty;
	
		if((sx ? (x+dx < tx) : (x+dx > tx)) && (sy ? (y+dy < ty) : (y+dy > ty))) {
			mode = 0;
		}
	}
}
else if(is_split_cannon) {
	if(scd <= 0) {
		var so = instance_copy(false);
		
		so.theta = theta + rot*cur_s + pi/2;
		cur_s++;
		scd += .3;
		
		so.is_split_cannon = false;
		so.is_split_orb = true;
		so.prev_sprite = sprite_index;
		so.life = deflife;
		so.sprite_index = spr_bullet_enemy_ring;
	}

	scd -= dt;
	
	move_linear();
}
else if(is_split_orb) {
	if(tts <= 0) {
		var b = spawn_circular(2, noone, noone, theta, 10, 0, true, true);
		for(var c = 0; c < 2; c++) {
			b[c].sprite_index = b[c].prev_sprite;
			b[c].is_split_orb = false;
			b[c].life = deflife;
			b[c].t = 0;
			b[c].t0 = 0;
			b[c].x0 = x;
			b[c].y0 = y;
		}
		instance_destroy();
	}

	tts -= dt;

}
else {
	do_move(mov_pat);
}

t+=dt;
t0+=dt;
life -= dt;
if (life <= 0 && !is_knife) {
	instance_destroy();	
}