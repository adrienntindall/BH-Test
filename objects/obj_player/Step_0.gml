/// @description Movement + Shooting
var dt = global.dt;

//Death
if(hp <= 0) game_restart();
if(keyboard_check(ord("K"))) game_restart();
if(keyboard_check_pressed(vk_escape)) {
	
	//room_goto(room_menu_pause);
}
//Movement Variables
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
down = keyboard_check(ord("S"));
up = keyboard_check(ord("W"));
shoot = mouse_check_button(mb_left);
focus = keyboard_check(vk_shift);
dodge = mouse_check_button_pressed(mb_right)
var s = dt*(focus ? fspd:spd);
if(focus) draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
bomb = keyboard_check_pressed(vk_space);

//X & Y Direction Setting
dx = (right - left);
dy = (down - up);

//Movement
var theta = arctan2(dy, dx);

dx = s*cos(theta)*abs(dx);
dy = s*sin(theta)*abs(dy);

//Collisions
var bbox_side;

if(dx > 0) bbox_side = bbox_right; else bbox_side = bbox_left;

if(tilemap_get_at_pixel(tilemap, bbox_side + dx, bbox_top) != 0 
	|| tilemap_get_at_pixel(tilemap, bbox_side+dx, bbox_bottom) != 0) {
	if(dx > 0) x = x - (x % 64) + 63 - (bbox_right - x);
	else x = x - (x % 64) - (bbox_left-x);
	dx = 0;
}

if(dy > 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;

if(tilemap_get_at_pixel(tilemap, bbox_left, bbox_side + dy) != 0 
	|| tilemap_get_at_pixel(tilemap, bbox_right, bbox_side+dy) != 0) {
	if(dy > 0) y = y - (y % 64) + 63 - (bbox_bottom - y);
	else y = y - (y % 64) - (bbox_top-y);
	dy = 0;
}

x += dx;
y += dy;

//Misc.
if((global.weapon == weapon_list.knives) || (global.weapon_alt == weapon_list.knives)) {
	if(!instance_exists(obj_knife)) for(var z = 0; z < 5; z++) {
		var k = instance_create_depth(x, y, 1, obj_knife);
		k.index = z;
		k.t = z*k.w/5;
	}
	else {
		for(var z = 0; z < 5; z++) {
			var flag = false;
			with(obj_knife) if(index == z) flag = true;
			if(!flag) {
				var k = instance_create_depth(x, y, 1, obj_knife);
				k.index = z;
				k.t = z*k.w/5;
			}
		}
	}
}

//Fireing bullets
if(shoot && cd <= 0) {
	switch(focus ? global.weapon_alt : global.weapon) {
		case weapon_list.simple:
			var theta = point_direction(x, y, mouse_x, mouse_y);
			b =  instance_create_depth(x, y, 0, obj_bullet);
			b.image_angle = theta;
			b.theta = pi * (theta/180);
			cd = .07;
			break;
		case weapon_list.simple_alt:
			var theta = point_direction(x, y, mouse_x, mouse_y);
			b =  instance_create_depth(x, y, 0, obj_bullet_sin);
			b.image_angle = theta;
			b.theta = pi * (theta/180);
			b.t0 = t;
			t+=2;
			cd = .07;
			break;
		case weapon_list.octo:
			spawn_circular(8, obj_bullet_sin, id, 0, 10);
			cd = 8/30;
			t+=3;
			break;
		case weapon_list.knives:
			with(obj_knife) {
				if((index == other.kix) && (obj_player.kcd <= 0) && (mode == 0)) {
					obj_knife.theta = point_direction(x, y, mouse_x, mouse_y)*pi/180;
					mode = 1;
					obj_player.kcd = .5;
					obj_player.kix = (other.kix + 1) % 5;
					maxd = min(max(sqrt((x-mouse_x)*(x-mouse_x) + (y-mouse_y)*(y-mouse_y)), 100), defmaxd);
					image_angle = obj_knife.theta*180/pi;
					break;
				}
			}
			break;
		case weapon_list.pow_orb:
			if!(instance_exists(obj_bullet_pow_orb)) {
				instance_create_depth(x, y, 1, obj_bullet_pow_orb);	
			}
			break;
		case weapon_list.split_orb:
			var ss = instance_create_depth(x, y, 1, obj_split_spawner);
			var theta = point_direction(x, y, mouse_x, mouse_y)*pi/180;
			ss.theta = theta;
			cd = 1;
			break;
		case weapon_list.flamethrower:
			repeat(floor(random(3) + 1)) {
				var spread = random(pi/4)-pi/8;
				var theta = point_direction(x, y, mouse_x, mouse_y)*pi/180; 
				var fire = instance_create_depth(x, y, 1, obj_ft_fire);
				fire.theta = theta+spread;
				fire.image_angle = fire.theta *180/pi;
				cd = .1;
			}
			break;
		case weapon_list.life_channel:
			var th = point_direction(x, y, mouse_x, mouse_y)*pi/180;
			instance_create_depth(x, y, 1, obj_life_channel);
			with(obj_life_channel) { 
				obj_life_channel.theta = th; 
				image_angle = (th-pi/2)*180/pi; 
				}
			break;
		default:
			break;
	}
}

var end_fire = mouse_check_button_released(mb_left);
if(end_fire) {
	switch(focus ? global.weapon_alt : global.weapon) {
		case weapon_list.pow_orb:
			instance_destroy(obj_bullet_pow_orb);
			break;
		default:
			break;
	}
	cd = .25;
}

//Focus Mode
if(tscd <= 0) tslim = 3;
if(shcd <= 0) { fshbr = false; shcd = 5; }
if(focus) switch(global.focus) {
	case focus_list.basic:
		break;
	case focus_list.time_slow:
		if(tslim > 0) {
			with(obj_bullet_enemy) {
				if(!feff) {
					image_blend = c_silver;
					spd	/= 2;
					feff = true;
				}
			}
		tslim-=dt;
		}
		else {
			with(obj_bullet_enemy) {
				if(feff) {
					image_blend = -1;
					spd = defspd;
					feff = false;
				}
			}
		}
		tscd = 3;
		break;
	case focus_list.shield:
		if(!instance_exists(obj_focus_shield) && !fshbr) {
			instance_create_depth(x, y, 0, obj_focus_shield);
		}
		break;
	default:
		break;
}
var end_focus = keyboard_check_released(vk_shift);
if(end_focus) switch(global.focus) {	
	case focus_list.basic:
		break;
	case focus_list.time_slow:
		with(obj_bullet_enemy) {
			if(feff) {
				image_blend = -1;
				spd = defspd;
				feff = false;
			}
		}
		break;
	case focus_list.shield:
		if(instance_exists(obj_focus_shield)) with(obj_focus_shield) instance_destroy();
		break;
	default:
		break;
}

//Bombs
if(bomb && bombs > 0) {
	bombs--;
	var xx = x;
	var yy = y;
	var br = bomb_r;
	with(obj_bullet_enemy) {
		if((xx-x)*(xx-x) + (yy-y)+(yy-y) <= br*br) instance_destroy();
	}
	with(obj_enemy) {
		if((xx-x)*(xx-x) + (yy-y)*(yy-y) <= br*br) hp-=other.bomb_damage;	
	}
}

//Cooldown Updates
cd-=dt;
kcd-=dt;
tscd-=dt;
shcd-=dt;