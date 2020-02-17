///move_lazer_linear()

while(wall_collision(tilemap, id, spd*dt*cos(theta), -spd*dt*sin(theta)) && !(dt > .1)) {
	image_xscale-=dt;
}

image_xscale += dt*spd;

defspd = a < 0 ? max(defspd+dt*a, minspd) : (a == 0 ? defspd : min(defspd+dt*a, maxspd));
spd = defspd;

in_theta = arctan2(vrad*image_yscale, image_xscale*hrad);