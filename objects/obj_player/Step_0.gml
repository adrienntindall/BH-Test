/// @description Movement + Shooting

//Death
if(hp <= 0) game_restart();


//Movement Variables
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
down = keyboard_check(ord("S"));
up = keyboard_check(ord("W"));
shoot = mouse_check_button(mb_left);
focus = keyboard_check(vk_shift);
dodge = mouse_check_button_pressed(mb_right)
var s = focus ? fspd:spd;

//X & Y Direction Setting
dx = (right - left);
dy = (down - up);

/*//Enemy Lock Mechanism
if(keyboard_check_pressed(vk_control) || !instance_exists(lock)) {
	var ex = instance_exists(lock);
	if(!ex) lock = instance_nearest(x, y, obj_enemy);
	if(!instance_exists(lock)) lock = noone;
	else if(lcd <= 0 || !ex) {
		mlock = instance_number(obj_enemy);
		for(c = 0; c < mlock; c++) {
			locks[c] = instance_nth_nearest(x, y, obj_enemy, c);
		}
		clock = 0;
		lock = locks[clock];
		lock.locked = true;
	}
	else {
		clock = (clock+1)%mlock;
		lock.locked = false;
		lock = locks[clock];
		lock.locked = true;
	}
	lcd = 120;
}

if(!(dx == 0 && dy == 0) && !(shoot || lock != noone)) image_angle= point_direction(0, 0, dx, dy);
*/
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

//Fireing bullets
if(shoot && cd <= 0) {
	var theta = point_direction(x, y, mouse_x, mouse_y);
	b =  instance_create_depth(x, y, 0, obj_bullet);
	b.image_angle = theta;
	b.theta = pi * (theta/180);
	/*var r = 50;
	for(c = -1; c < 2; c++) {
		if(lock != noone) image_angle= point_direction(x, y, lock.x, lock.y);
		b = focus ? instance_create_depth(x+c*r*cos(pi*c), y+c*r*sin(pi*c), 0, obj_bullet)
				  : instance_create_depth(x, y, 0, obj_bullet);
		//b.direction = image_angle;
		b.image_angle = focus ? image_angle : image_angle+15*c;
		b.theta = pi*b.image_angle/180;
		b.image_alpha = .7;
		b.t0 = t;
		t++;
	}
	cd = 4;*/
}

//Cooldown Updates
cd--;
lcd--;