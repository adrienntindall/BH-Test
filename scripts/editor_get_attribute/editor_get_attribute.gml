///editor_get_attribute(col, variable, id)
///@param col
///@param var
///@param id

var obj = argument2;
var bullet = obj.bullet;

switch(argument0) {
	case editor_column_type.spawn:
		switch(argument1) {
			case spawn_vars.n:
				return obj.n;
				break;
			case spawn_vars.radius:
				return obj.rad;
				break;
			case spawn_vars.theta:
				return obj.theta;
				break;
			case spawn_vars.cooldown:
				return obj.def_cd;
				break;
			case spawn_vars.angle:
				return obj.angle;
				break;
			case spawn_vars.delta_theta:
				return obj.dtheta;
				break;
		}
		break;
	case editor_column_type.pattern:
		switch(argument1) {
			case pattern_vars.spd:
				return bullet.defspd;
				break;
			case pattern_vars.acceleration:
				return bullet.a;
				break;
			case pattern_vars.maxspeed:
				return bullet.maxspd;
				break;
			case pattern_vars.minspeed:
				return bullet.minspd;
				break;
		}
		break;
	case editor_column_type.path:
		switch(argument1) {
			case path_vars.radius:
				return obj.r;
				break;
		}
		break;
}
