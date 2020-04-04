/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
bmap_id = layer_tilemap_get_id("Borders");
closing = false;
cspd = 230;
define_rectangle();

max_tiles = 4.5;

scale_init = abs(bbox_left-bbox_right);

audio_sound_gain(snd_moving_doors, 0, 0);
close_snd = audio_play_sound(snd_moving_doors, 3, false);
audio_pause_sound(close_snd);
audio_sound_gain(snd_moving_doors, .1, 0);