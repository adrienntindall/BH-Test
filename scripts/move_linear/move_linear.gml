///move_linear()

if(wall_collision(tilemap, id, spd*dt*cos(theta), -spd*dt*sin(theta))) {
	if(wall_bounce) {
		if(bounce == max_bounce) instance_destroy();
		if(wall_collision(tilemap, id, 0, -spd*dt*sin(theta))) theta = -theta;
		else theta = pi-theta;
		bounce++;
	}
	else instance_destroy();
}

x += spd*dt*cos(theta);
y += -spd*dt*sin(theta);
defspd = a < 0 ? max(defspd+dt*a, minspd) : (a == 0 ? defspd : min(defspd+dt*a, maxspd));
spd = defspd;