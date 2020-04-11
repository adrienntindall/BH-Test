/// @description Insert description here
// You can write your code in this editor

draw_self();

if(charged) {
	var cscale = max(sprite_width/sprite_get_width(spr_charge_effect), sprite_height/sprite_get_height(spr_charge_effect));
	draw_sprite_ext(spr_charge_effect, 0, center_x(self), center_y(self), cscale, cscale, image_angle, c_white, .45);
}