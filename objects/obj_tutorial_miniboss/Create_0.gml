/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp = 12;
phase = 1;
num_attacks = 5;
cd = zeros_arr(num_attacks);
cur_bul = zeros_arr(num_attacks);
laz_arr = n1_arr(num_attacks);

spell_surf = surface_create(room_width-64*2, room_height-64*2);
coff = 0;
cspd = 20;