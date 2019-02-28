///move_loop_const(x_egg, x_disp, y_egg)
///@param x_egg
///@param x_dsiplacement
///@param y_egg

var z = argument1;
var b = argument0;
var c = argument2;

move_eq_para(z*t+b*sin(t), c + c*cos(t));
t+=global.dt;