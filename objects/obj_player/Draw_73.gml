/// @description Drawing HUD

//Drawing Hitbox
if(focus || fast) {
	draw_set_color(c_purple);
	draw_circle(x, y, crad, false);
}

//Player HP bar
draw_healthbar(x-30, y+30, x+30, y+35, hp/maxhp*100, c_purple, c_red, c_green, 0, false, true);
