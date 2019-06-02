/// @description Drawing HUD

//Drawing Hitbox
if(focus || fast) {
	draw_set_color(c_purple);
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);	
}

//Player HP bar
draw_healthbar(x-30, y+30, x+30, y+35, hp/maxhp*100, c_purple, c_red, c_green, 0, false, true);

//Boss HP Bar
var vx = camera_get_view_x(view_camera[0]);
var vy = camera_get_view_y(view_camera[0]);
var vh = camera_get_view_height(view_camera[0]);
var vw = camera_get_view_width(view_camera[0]);

if(!boss_defeated && (x >= global.broom_x1-64) && (x <= global.broom_x2+65) && (y >= global.broom_y1-64) && (y <= global.broom_y2+65)) {
	draw_healthbar(vx, vy+vh-30, vx+vw, vy+vh, global.boss.hp/global.boss.maxhp * 100, 
					c_purple, c_red, c_green, 0, true, true);
}