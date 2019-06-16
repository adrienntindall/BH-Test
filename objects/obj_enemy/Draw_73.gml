/// @description Insert description here
// You can write your code in this editor

//draw status badges

var se_cnt = 0;
var badge_r = 3;

if(on_fire) {
	draw_set_alpha(min(1, flame_time));
	draw_circle_color(bbox_right-badge_r*(1-3*se_cnt), bbox_bottom-badge_r, badge_r, c_red, c_red, false);
	se_cnt++;
}

if(slow) {
	draw_set_alpha(min(1, slowtime));
	draw_circle_color(bbox_right-badge_r*(1-3*se_cnt), bbox_bottom-badge_r, badge_r, c_blue, c_blue, false);	
	se_cnt++;
}

if(stuned) {
	draw_set_alpha(min(1, stun_time));
	draw_circle_color(bbox_right-badge_r*(1-3*se_cnt), bbox_bottom-badge_r, badge_r, c_ltgray, c_ltgray, false);
	se_cnt++;
}

if(charged) {
	draw_set_alpha(min(1, charged_time));
	draw_circle_color(bbox_right-badge_r*(1-3*se_cnt), bbox_bottom-badge_r, badge_r, c_yellow, c_yellow, false);
	se_cnt++;
}

draw_set_alpha(1);