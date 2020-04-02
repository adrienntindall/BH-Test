/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp = 12;
max_hp = hp;
phase = 1;
num_attacks = 5;
cd = zeros_arr(num_attacks);
cur_bul = zeros_arr(num_attacks);
laz_arr = n1_arr(num_attacks);
attack_sound = homo_arr(num_attacks, snd_attack_def);
attack_sound[0] = snd_magic_attack;
attack_sound[3] = snd_heavy;
def_volume = homo_arr(num_attacks, .1);
def_volume[4] = .05;

spell_surf = surface_create(room_width-64*2, room_height-64*2);
coff = 0;
cspd = 20;

phase_time = 20;
def_phase_time = phase_time;


