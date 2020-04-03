/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp = 12;
max_hp = hp;
phase = 1;
num_attacks = 12;
cd = homo_arr(num_attacks, .5);
cur_bul = zeros_arr(num_attacks);
laz_arr = n1_arr(num_attacks);
attack_sound = homo_arr(num_attacks, snd_attack_def);
attack_sound[0] = snd_magic_attack;
for(var c = 0; c < 5; c++) {
	cd[c+2] += .05*c;
	attack_sound[c+2] = snd_heavy;
}
attack_sound[8] = snd_magic_attack;
attack_sound[11] = snd_magic_attack;
def_volume = homo_arr(num_attacks, .1);
def_volume[8] = .05;

spell_surf = surface_create(room_width-64*2, room_height-64*2);
coff = 0;
cspd = 20;

phase_time = 20;
def_phase_time = phase_time;

surf_alpha = 0;