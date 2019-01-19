///move_beam()

var dt = global.dt;

if(wall_collision(tilemap, id, spd*dt*cos(theta), -spd*dt*sin(theta))) {
	instance_destroy();
}	

x = x0 + t*spd*cos(theta);
y = y0 - t*spd*sin(theta);