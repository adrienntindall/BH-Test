/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

phase = 1;
hp = 10;

num_attacks = 100;
cd = zeros_arr(num_attacks);
cur_bul = zeros_arr(num_attacks);
laz_arr = n1_arr(num_attacks);

minth = 0;
hourth = 0;
secth = 0;

secr = abs(sprite_get_bbox_top(spr_second_hand)-sprite_get_yoffset(spr_second_hand))*4;
hourr = abs(sprite_get_bbox_top(spr_hour_hand)-sprite_get_yoffset(spr_hour_hand))*4;
minr = abs(sprite_get_bbox_top(spr_minute_hand)-sprite_get_yoffset(spr_minute_hand))*2.25;
