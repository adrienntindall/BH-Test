///spawn_arc_spread(n, bullet_type, parent, theta0, arc_length, radius, cd_val, copy)
///@param n
///@param bullet_type
///@param parent
///@param theta0
///@param arc_len
///@param radius
///@param cooldown
///@param copy

var n = argument0;
var theta = argument3;
var dtheta = argument4;
var r = argument5;
var bt = argument1;
var copy = argument7;
var store = (laz_arr[clay] == -1);
var arr = -1;

if(cd[clay] <= 0) {
	for(var c = 0; c < n; c++) {
		var theta_c = theta + c*dtheta/n;
		var b;
		var xx = x+r*cos(theta_c);
		var yy = y-r*sin(theta_c);
		b = instance_create_depth(xx,yy,0,bt);
		b.parent = argument2;
		b.theta = theta + c*dtheta/n;
		b.image_angle = b.theta*180/pi;
		cur_bul[clay]++;
		if(store) arr[c] = b;
	}
	cd[clay] = argument6;
	audio_play_sound_at(attack_sound[clay], x, y, 0, 100, 300, 1, false, 2);
	var snd_amt = is_undefined(ds_map_find_value(obj_musicHandler.frame_sound, audio_get_name(attack_sound[clay]))) ?  1 : ds_map_find_value(obj_musicHandler.frame_sound, audio_get_name(attack_sound[clay])) + 1;
	ds_map_replace(obj_musicHandler.frame_sound, audio_get_name(attack_sound[clay]), snd_amt);
	audio_sound_gain(attack_sound[clay], def_volume[clay]/snd_amt, 0);
}
else cd[clay] -= dt;
