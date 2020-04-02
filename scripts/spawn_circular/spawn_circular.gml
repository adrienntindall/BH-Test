///spawn_circular(n, x, y, bullet_type, parent, offset, r, cd, copy*, inst_copy*, isLazer*)
//@desc Circular bullet pattern with n spokes
///@param n
///@param x
///@param y
///@param {real} bullet_type  (object) bullet type
///@param {real} parent  id of parent of bullet
///@param theta
///@param radius
///@param cd
///@param storage*
///@param copy*
///@param isLazer*
var n = argument[0];
var xx = argument[1];
var yy = argument[2];
var bt = argument[3];
var theta = 2*pi/n; 
var r = argument[6];
var arr = -1;
var store = false;
var copy = false;
var isLazer = false;
if((argument_count > 8 && argument[8] == true)) store = true;
if(argument_count > 9 && argument[9] == true) copy = true;
if(argument_count > 10 && argument[10] == true) isLazer = true;
if(cd[clay] <= 0) {
	for (var c = 0; c < n; c++) {
		var b = noone;
		var th = theta*c + argument[5];
		var xxx = xx+r*cos(th);
		var yyy = yy-r*sin(th);
		if(isLazer && laz_arr[clay] != -1) {
			var bar = laz_arr[clay]
			b = bar[c];
			b.x = xxx;
			b.y = yyy;
			b.in_theta = th;
		}
		else if(copy) b = bullet_copy(bt, xxx, yyy);
		else b = instance_create_depth(xxx,yyy,0,bt);
		b.theta = th;
		b.image_angle = b.theta*180/pi;
		b.parent = argument[4];
		b.t0 = t;
		cd[clay] = argument[7];
		//if(variable_instance_exists(id, "cur_bul")) 
		if(store) arr[c] = b;
	}
	cur_bul[clay]++;
	audio_play_sound_at(attack_sound[clay], x, y, 0, 100, 300, 1, false, 2);
	var snd_amt = is_undefined(ds_map_find_value(obj_musicHandler.frame_sound, audio_get_name(attack_sound[clay]))) ?  1 : ds_map_find_value(obj_musicHandler.frame_sound, audio_get_name(attack_sound[clay])) + 1;
	ds_map_replace(obj_musicHandler.frame_sound, audio_get_name(attack_sound[clay]), snd_amt);
	audio_sound_gain(attack_sound[clay], def_volume[clay]/snd_amt, 0);
	
}
else cd[clay] -= dt;

if(isLazer) {
	laz_arr[clay] = arr;
}

if(store) {
	return arr;
}
