/// @description Insert description here
// You can write your code in this editor
dt = global.dt;

draw_self();

if(pulse) {
	cur_rad += dt*rspd;
	var surf = surface_create(cur_rad*2, cur_rad*2);
	surface_set_target(surf);
	draw_circle_colour(cur_rad, cur_rad, cur_rad, c_gray, c_gray, false);
	gpu_set_blendmode(bm_subtract);
	draw_circle_colour(cur_rad, cur_rad, cur_rad-4, c_white, c_white, false);
	surface_reset_target();
	gpu_set_blendmode(bm_normal);
	draw_surface(surf, x-cur_rad, y-cur_rad);
	if(cur_rad >= maxrad) {
		cur_rad = 0;
		pulse = false;
	}
}