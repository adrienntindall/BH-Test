/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

phase = 1;
clay = 0;

hp = 20;

num_attacks = 110;
cd = zeros_arr(num_attacks);
cur_bul = zeros_arr(num_attacks);
laz_arr = n1_arr(num_attacks);
cd[1] = .5;
cd[4] = .25;

spell_surf = surface_create(room_width-64*2, room_height-64*2);
coff = 0;
cspd = 20;