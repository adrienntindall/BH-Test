/// @description Insert description here
// You can write your code in this editor

var dt = global.dt;

x0 = parent.x;
y0 = parent.y;

rotate_3d(r*sin(t), r*cos(t), 0, 0, .7, 2.5*thetaxz);

t+=dt;
thetaxz+=dt;