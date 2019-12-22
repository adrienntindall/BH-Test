///move_linear()

if(wall_collision(tilemap, id, spd*dt*cos(theta), -spd*dt*sin(theta))) {
	if(object_index != obj_weapon && object_get_parent(object_index) != obj_weapon) instance_destroy();
}

x += spd*dt*cos(theta);
y += -spd*dt*sin(theta);
defspd = a < 0 ? max(defspd+dt*a, minspd) : (a == 0 ? defspd : min(defspd+dt*a, maxspd));
spd = defspd;