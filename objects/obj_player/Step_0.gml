/// @description Handles all actions of the player that needs to be checked
dt = global.dt;

do_passive();
do_active();

//Death
if(hp <= 0) game_restart();
if(keyboard_check(ord("K"))) game_restart(); //a quick restart for debugging purposes only

//Movement Variables
left = keyboard_check(vk_left);
right = keyboard_check(vk_right);
down = keyboard_check(vk_down);
up = keyboard_check(vk_up);
focus = keyboard_check(vk_shift);
fast = keyboard_check(ord("Z"));
var s = dt*(focus ? fspd:(fast ? qspd:spd)); //placeholder variable for determining how many total spaces to move this frame
if(focus || fast) draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true); //draws the hitbox

//X & Y Direction Setting
dx = (right - left); 
dy = (down - up);

//Movement
var theta = arctan2(dy, dx);

dx = s*cos(theta)*abs(dx);
dy = s*sin(theta)*abs(dy);

//Collisions
var bbox_side;

//X-Direction collisions
if(dx > 0) bbox_side = bbox_right; else bbox_side = bbox_left;

if(tilemap_get_at_pixel(tilemap, bbox_side + dx, bbox_top) != 0 
	|| tilemap_get_at_pixel(tilemap, bbox_side+dx, bbox_bottom) != 0) {
	if(dx > 0) x = x - (x % 64) + 63 - (bbox_right - x);
	else x = x - (x % 64) - (bbox_left-x);
	dx = 0;
}

//Y-Direction Collisions
if(dy > 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;

if(tilemap_get_at_pixel(tilemap, bbox_left, bbox_side + dy) != 0 
	|| tilemap_get_at_pixel(tilemap, bbox_right, bbox_side+dy) != 0) {
	if(dy > 0) y = y - (y % 64) + 63 - (bbox_bottom - y);
	else y = y - (y % 64) - (bbox_top-y);
	dy = 0;
}

x += dx;
y += dy;

with(obj_bullet_enemy) {
	if(objects_collide(id, other)) {
		other.hp--;
		if(destroy) instance_destroy();
	}
}

//Cooldown Updates
cd[focus]-=dt;
kcd-=dt;
tscd-=dt;
shcd-=dt;