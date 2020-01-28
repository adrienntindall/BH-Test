/// @description Insert description here
// You can write your code in this editor


enum pat {
	circular,
	length	
};

enum pOptions {
	n,
	theta,
	radius,
	cooldown,
	length
};

pattern = pat.circular;
n = 2;
theta = 0;
rad = 0;
def_cd =  1;
cd = 0;
cd[0] = def_cd;
clay = 0;
t = 0;

bullet = instance_create_depth(x, y, 999, obj_pattern_bullet);
instance_deactivate_object(bullet);
