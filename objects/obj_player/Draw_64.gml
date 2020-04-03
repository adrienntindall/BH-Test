/// @description Insert description here
// You can write your code in this editor
for(var c = 0; c < hp; c++) {
	draw_sprite_ext(spr_heart, 0, (16 + c*60)*global.c, 16*global.c, global.c*.06, global.c*.06, 0, c_white, 1);
}
for(var c = 0; c < array_length_1d(global.active_eq); c++) {
	var cmd = -1;
	switch(c+1) {
		case 1:
			cmd = "X";
			break;
		case 2:
			cmd = "C"
			break;
		case 3:
			cmd = "V";
			break;
		case 4:
			cmd = "Space";
			break;
	}
	var obj = global.active_eq[c];
	if(!(obj != -1 && instance_exists(obj))) continue;
	var ch = 999;
	for(var z = 0; z < array_length_1d(obj.c_max); z++) {
		ch = min(ch, floor(obj.c_max_charge*obj.c_amnts[z]/obj.c_max[z]));
	}
	draw_set_font(font_menu);
	draw_set_valign(fa_bottom);
	draw_text_transformed(global.c*16, global.c*(120 + c*16), cmd, global.c*.5, global.c*.5, 0);
	draw_set_valign(fa_top);
	for(var z = 0; z < ch; z++) {
		draw_sprite_ext(obj.ui_sprite, 0, global.c*(75 + 35*z - sprite_get_xoffset(obj.ui_sprite)*50/sprite_get_width(obj)), 
											global.c*(120 + c*16 - sprite_get_yoffset(obj.ui_sprite)*50/sprite_get_height(obj)), 
											global.c*50/sprite_get_width(obj), 
											global.c*50/sprite_get_width(obj), 0, c_white, 1); 
	}
}