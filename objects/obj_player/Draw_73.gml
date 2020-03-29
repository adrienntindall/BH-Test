/// @description Drawing HUD

if(!obj_camera.pan) {
	//Drawing Hitbox
	if(focus || fast) {
		draw_set_color(focus ? c_purple : c_orange);
		draw_circle(x, y, crad, false);
	}

	if(fast && (dx != 0 || dy != 0)) {
		if(runcd <= 0) {
			repeat(irandom(3)) {
				var rp = instance_create_depth(x, y, 2, obj_run_particle);
				rp.theta = theta + pi/8 * sin(random(2*pi));
			}
			runcd += .05;
		}
		runcd -= dt;
	}

	//Player HP bar
	//draw_healthbar(x-30, y+30, x+30, y+35, hp/maxhp*100, c_purple, c_red, c_green, 0, false, true);
}