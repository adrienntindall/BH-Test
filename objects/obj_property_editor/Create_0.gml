/// @description Insert description here
// You can write your code in this editor

depth = 5;

editingMode = false;
screenshot = -1;
curObj = -1;

yspace = 70;

enum spawn_op {
	circular,
	length
};

cur_spawn = spawn_op.circular;

spawn_op_name = -1;
spawn_op_name[spawn_op.circular] = "Circular";

enum pattern_op {
	linear,
	length	
};

cur_pattern = pattern_op.linear;

pattern_op_name = -1;
pattern_op_name[pattern_op.linear] = "Linear";

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



enum path_op {
	static,
	length
}

cur_path = path_op.static;

path_op_name = -1;
path_op_name[path_op.static] = "Static";

path_settings = -1;
path_settings[path_op.static] = array(-1);