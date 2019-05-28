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

x0 = parent.x;
y0 = parent.y;

rotate_3d(r*sin(t), r*cos(t), 0, 0, .7, 2.5*thetaxz);

t+=dt;
thetaxz+=dt;