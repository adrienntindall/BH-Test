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
cd[41] = .5;
cd[42] = .6;
attack_sound = homo_arr(num_attacks, snd_attack_def);
attack_sound[0] = snd_magic_attack;
attack_sound[1] = snd_magic_attack;
attack_sound[2] = snd_heavy;
attack_sound[20] = snd_magic_attack;
attack_sound[21] = snd_heavy;
attack_sound[22] = snd_heavy;
attack_sound[40] = snd_heavy;
attack_sound[50] = snd_heavy;
attack_sound[51] = snd_heavy;

def_volume = homo_arr(num_attacks, .1);


spell_surf = surface_create(room_width-64*2, room_height-64*2);
surf_alpha = 0;
coff = 0;
cspd = 20;

phase_time = 30;
def_phase_time = phase_time;