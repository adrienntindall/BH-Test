/// @description Insert description here
// You can write your code in this editor
if(focus) {
	draw_set_color(c_purple);
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);	
}

draw_healthbar(x-30, y+30, x+30, y+35, hp/maxhp*100, c_purple, c_red, c_green, 0, false, true);

//Boss HP Bar
if((x > global.broom_x1) && (x < global.broom_x2) && (y > global.broom_y1) && (y < global.broom_y2)) {
	var vx = camera_get_view_x(view_camera[0]);
	var vy = camera_get_view_y(view_camera[0]);
	var vh = camera_get_view_height(view_camera[0]);
	var vw = camera_get_view_width(view_camera[0]);
	draw_healthbar(vx, vy+vh-30, vx+vw, vy+vh, global.boss.hp/global.boss.maxhp * 100, 
					c_purple, c_red, c_green, 0, true, true);
}