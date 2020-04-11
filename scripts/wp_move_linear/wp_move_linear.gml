///wp_move_linear()

x += spd*dt*cos(theta);
y += -spd*dt*sin(theta);
defspd = a < 0 ? max(defspd+dt*a, minspd) : (a == 0 ? defspd : min(defspd+dt*a, maxspd));
spd = defspd;