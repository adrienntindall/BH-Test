///rotate_2d(X, Y, theta)
///@param X
///@param Y
///@param theta

var X = argument0, Y = argument1, theta = argument2;

x = x0 + X*cos(theta) - Y*sin(theta);
y = y0 - (X*sin(theta) + Y*cos(theta));