///move_loop_alt(x_egg, x_disp, y_egg)
///@param x_egg
///@param x_dsiplacement
///@param y_egg

var z = argument1;
var b = argument0;
var c = argument2;


var X = (tx > 0 ) ? z*t+b*sin(t) : -z*t+b*sin(t) + 2*(z*ty0+b*sin(tx0));
var Y = (ty > 0 ) ? sign(sin(t/2))*(c - c*cos(t)) : -sign(sin(t/2))*(c - c*cos(t)) + 2*sign(sin(ty0/2))*(c - c*cos(ty0));

//var m = ((.5*cos(t/2)*(c-c*cos(t))+c*sin(t))*abs(sin(t/2)) - sign(sin(t/2))*cos(t/2)/2 * (sin(t/2)*(c-c*cos(t))))/(sin(t/2) * sin(t/2));
//m /= (z + b*cos(t));

//theta = arctan(m);

move_eq_para(X, Y);

//image_angle = arctan(m)*180/pi;

t+=tspd*global.dt;
tspd += ta*global.dt;