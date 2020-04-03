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
	draw_set_font(font_menu);
	var obj = global.active_eq[c];
	draw_set_valign(fa_top);
	if(obj != -1) draw_text_transformed(50, global.c*(80 + c*16), cmd, global.c*.7, global.c*.7, 0)
	if(obj != -1 && instance_exists(obj)) draw_sprite_ext(obj.ui_sprite, 0, 150 + obj.x - obj.bbox_left, 200 + c*32 + obj.y - obj.bbox_top, 150/sprite_get_width(obj), 150/sprite_get_width(obj), 0, c_white, 1);  
}