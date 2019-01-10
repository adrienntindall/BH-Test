///rotate_3d(X, Y, Z, txy, tyz, txz)

var X = argument0; var Y = argument1; var Z = argument2;
var txy = argument3; var tyz = argument4; var txz = argument5;

x = x0 + (X*cos(txy) - Y*sin(txy))*cos(txz) - (X*sin(txy)+Y*cos(txy))*sin(tyz) - Z*cos(tyz);
y = y0 + (X*sin(txy) - Y*cos(txy))*cos(tyz) - Z*sin(tyz);
z = (X*cos(txy) - Y*sin(txy))*sin(txz) +(X*sin(txy) + Y*cos(txy))*sin(tyz) + Z*cos(tyz);
depth = z < 0 ? 2 : 0;