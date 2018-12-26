///noise(x, y, z, p)

var xx = argument0;
var yy = argument1;
var z = argument2;
var p = argument3;

var X = floor(xx) & 255;
var Y = floor(yy) & 255;
var Z = floor(z) & 255;

xx -= floor(X);
yy -= floor(Y);
z -= floor(Z);

u = fade(xx);
v = fade(yy);
w = fade(z);

var A = p[X] + Y;
var AA = p[A] + Z;
var AB = p[A + 1] + Z;
var B = p[X + 1] + Y;
var BA = p[B] + Z;
var BB = p[B + 1] + Z;

res = lerp(w, lerp(v, lerp(u, grad(p[AA], xx, yy, z), grad(p[BA], xx - 1, yy, z)), 
			lerp(u, grad(p[AB], xx, yy - 1, z), grad(p[BB], xx - 1, yy - 1, z))), 
			lerp(v, lerp(u, grad(p[AA + 1], xx, yy, z - 1), 
			grad(p[BA + 1], xx - 1, yy, z - 1)), 
			lerp(u, grad(p[AB + 1], xx, yy - 1, z - 1), 
			grad(p[BB + 1], xx - 1, yy - 1, z - 1))));
			
return (res + 1.0) / 2.0;