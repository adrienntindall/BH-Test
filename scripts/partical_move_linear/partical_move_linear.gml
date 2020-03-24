///partical_move_linear()
if(wall_collision(tilemap, id, spd*dt*cos(theta), -spd*dt*sin(theta))) {
	instance_destroy();
}

x += spd*dt*cos(theta);
y += -spd*dt*sin(theta);