/// @description Insert description here
// You can write your code in this editor
image_blend = c_white;

var dt = global.dt;

if(grtime == "nah") graze(true);
else if(grtime < 0) {
	graze(true);
	var gb = instance_create_depth(obj_player.x, obj_player.y, 1, global.graze_bts[floor(random(array_length_1d(global.graze_bts)))]);
	gb.theta = random(2*pi);
	show_debug_message("graze");
}
grtime = min(grtime-dt, graze(false));
