/// @description Insert description here
// You can write your code in this editor
if(phase mod 2 == 0 || phase = 5) {
	if(!surface_exists(spell_surf)) spell_surf = surface_create(room_width-64*2, room_height-64*2);
	surface_set_target(spell_surf);
	draw_sprite_ext(spr_galaxy_back, 0, 0, 0, surface_get_width(spell_surf)/sprite_get_width(spr_galaxy_back),
					surface_get_height(spell_surf)/sprite_get_height(spr_galaxy_back),
					0, c_white, surf_alpha);
	for(var c = -coff; c < surface_get_width(spell_surf); c+= sprite_get_width(spr_card_suits)) {
		for(var z = -coff; z < surface_get_height(spell_surf); z += sprite_get_height(spr_card_suits)) {
			draw_sprite_ext(spr_card_suits, 0, c, z, 1, 1, 0, c_white, surf_alpha*.1);
		}
	}
	coff = (coff + cspd*dt) mod min(sprite_get_width(spr_card_suits), sprite_get_height(spr_card_suits));
	surface_reset_target();
	draw_surface(spell_surf, 64, 64);
	surf_alpha += .5*dt;
	if(surf_alpha >= 1) surf_alpha = 1;
}

draw_self();

draw_set_font(font_menu);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_colour(c_white);
draw_text_transformed(x, y, string_format(phase_time, 2, 2), .8, .8, 0);
draw_set_halign(fa_left);
draw_set_valign(fa_top);