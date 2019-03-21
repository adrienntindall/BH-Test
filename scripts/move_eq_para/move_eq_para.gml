///move_eq(x_eq, y_eq)
///@param x_eq
///@param y_eq
var X = argument0;
var Y = argument1;
var dt = global.dt;

var dx = (X*cos(theta) - Y*sin(theta));
var dy = -(Y*cos(theta) + X*sin(theta));


//if(wall_collision(tilemap, id, dx, dy)) instance_destroy();

x = x0 + dx;
y = y0 + dy;