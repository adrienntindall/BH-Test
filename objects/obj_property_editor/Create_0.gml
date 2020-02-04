/// @description Insert description here
// You can write your code in this editor

depth = 5;

editingMode = false;
screenshot = -1;
curObj = -1;

yspace = 70;

enum spawn_op {
	circular,
	arc,
	length
};

cur_spawn = spawn_op.circular;

spawn_op_name = -1;
spawn_op_name[spawn_op.circular] = "Circular";
spawn_op_name[spawn_op.arc] = "Arc";

enum spawn_vars {
	n,
	radius,
	theta,
	delta_theta,
	angle,
	cooldown,
	length
}

spawn_vars_name[spawn_vars.n] = "n";
spawn_vars_name[spawn_vars.radius] = "Radius";
spawn_vars_name[spawn_vars.theta] = "Theta";
spawn_vars_name[spawn_vars.delta_theta] = "Delta Theta";
spawn_vars_name[spawn_vars.angle] = "Angle";
spawn_vars_name[spawn_vars.cooldown] = "Cooldown";

spawn_settings = -1;
spawn_settings[spawn_op.circular] = array(spawn_vars.n, spawn_vars.radius, spawn_vars.theta, spawn_vars.delta_theta, spawn_vars.cooldown);
spawn_settings[spawn_op.arc] = array(spawn_vars.n, spawn_vars.radius, spawn_vars.angle, spawn_vars.theta, spawn_vars.delta_theta, spawn_vars.cooldown);

enum pattern_op {
	linear,
	linear_lazer,
	length	
};

cur_pattern = pattern_op.linear;

pattern_op_name = -1;
pattern_op_name[pattern_op.linear] = "Linear";
pattern_op_name[pattern_op.linear_lazer] = "Linear Lazer";

enum pattern_vars {
	spd,
	acceleration,
	maxspeed,
	minspeed,
	length	
}

pattern_vars_name = -1;
pattern_vars_name[pattern_vars.spd] = "Speed";
pattern_vars_name[pattern_vars.acceleration] = "Acceleration";
pattern_vars_name[pattern_vars.maxspeed] = "Max Speed";
pattern_vars_name[pattern_vars.minspeed] = "Min Speed";

pattern_settings = -1;
pattern_settings[pattern_op.linear] = array(pattern_vars.spd, pattern_vars.acceleration, pattern_vars.maxspeed, pattern_vars.minspeed);
pattern_settings[pattern_op.linear_lazer] = array(pattern_vars.spd, pattern_vars.acceleration, pattern_vars.maxspeed, pattern_vars.minspeed);


enum path_op {
	static,
	circular,
	length
}

cur_path = path_op.static;

path_op_name = -1;
path_op_name[path_op.static] = "Static";
path_op_name[path_op.circular] = "Circular";

enum path_vars {
	radius,
	length
}

path_vars_name = -1;
path_vars_name[path_vars.radius] = "Radius";

path_settings = -1;
path_settings[path_op.static] = array(path_vars.radius);
path_settings[path_op.circular] = array(path_vars.radius);