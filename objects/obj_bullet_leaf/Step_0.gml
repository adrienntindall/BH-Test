/// @description Insert description here
// You can write your code in this editor
var dt = global.dt;

if(grtime == "nah") graze(true);
else if(grtime < 0) {
	graze(true);
	var gb = instance_create_depth(obj_player.x, obj_player.y, 1, obj_graze_ball);
	gb.theta = random(2*pi);
	show_debug_message("graze");
}
grtime = min(grtime-dt, graze(false));

if(life <= 0) instance_destroy();

move_loop_alt(75, 25, 50);

life -= dt;

