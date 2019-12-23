/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(spr_jp_title, 0, room_width/2, room_height*3/8, 5+flux*sin(t), 5+flux*sin(t), 0, c_white, 1);

draw_sprite(spr_jp_play, 0, room_width/2, room_height*5/8);
draw_sprite(spr_jp_create, 0, room_width/2, room_height*3/4);
//draw_sprite(spr_menu_cursor, 0, room_width/2, room_height*(5+cur_pos)/8);
draw_sprite(spr_menu_cursor, 0, room_width/2+30, room_height*(5+cur_pos)/8);
draw_sprite_ext(spr_press_c, 0, room_width/2 + 70, room_height*(5+cur_pos)/8, .5, .5, 0, c_white, .25);