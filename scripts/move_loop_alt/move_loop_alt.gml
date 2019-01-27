///move_loop_alt(x_egg, x_disp, y_egg)
///@param x_egg
///@param x_dsiplacement
///@param y_egg

var z = argument1;
var b = argument0;
var c = argument2;


var X = z*t+b*sin(t);
var Y = sign(sin(t/2))*(c - c*cos(t));

//var m = ((.5*cos(t/2)*(c-c*cos(t))+c*sin(t))*abs(sin(t/2)) - sign(sin(t/2))*cos(t/2)/2 * (sin(t/2)*(c-c*cos(t))))/(sin(t/2) * sin(t/2));
//m /= (z + b*cos(t));

//theta = arctan(m);

move_eq_para(X, Y);

//image_angle = arctan(m)*180/pi;

t+=spd*global.dt;