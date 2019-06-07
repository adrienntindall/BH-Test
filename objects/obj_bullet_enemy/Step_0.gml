/// @description Insert description here
// You can write your code in this editor
image_blend = c_white;

dt = global.dt;
if(instance_exists(parent) && parent.slow) dt*=.75;

if(grtime == "nah") graze(true);
else if(grtime < 0) {
	graze(true);
	var gb = instance_create_depth(obj_player.x, obj_player.y, 1, global.graze_bts[floor(random(array_length_1d(global.graze_bts)))]);
	gb.theta = random(2*pi);
}
grtime = min(grtime-dt, graze(false));
