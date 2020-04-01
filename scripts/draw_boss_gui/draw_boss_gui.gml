///draw_boss_gui
/*var surf_w = surface_get_width(application_surface) * .8;
var surf_h = surface_get_height(application_surface) * .1;
var surf = surface_create(surf_w, surf_h);
surface_set_target(surf);
draw_rectangle_color(0, 0, surf_w, surf_h, c_black, c_black, c_black, c_black, false);
gpu_set_blendmode(bm_subtract);
draw_rectangle_colour(surf_w*.07, surf_w*.07, surf_w*.93, surf_h-surf_w*.07, c_white, c_white, c_white, c_white, false);
gpu_set_blendmode(bm_normal);
draw_rectangle_colour(surf_w*.07, surf_w*.07, (surf_w*.93-surf_w*.07)*hp/max_hp, surf_h-surf_w*.07, c_red, c_red, c_green, c_green, false);
surface_reset_target();

draw_surface(surf, surface_get_width(application_surface)*.2/2, surface_get_height(application_surface)*.87);
surface_free(surf);*/