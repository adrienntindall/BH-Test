///editor_set_attribute(col, variable, id, attribute)
///@param col
///@param var
///@param id
///@param att

var obj = argument2;
var bullet = obj.bullet;
var c = argument3;

switch(argument0) {
	case editor_column_type.spawn:
		break;
	case editor_column_type.pattern:
		switch(argument1) {
			case pattern_vars.spd:
				bullet.spd = c;
				bullet.defspd = c;
				break;
			case pattern_vars.acceleration:
				bullet.a = c;
				break;
			case pattern_vars.maxspeed:
				bullet.maxspd = c;
				break;
			case pattern_vars.minspeed:
				bullet.minspd = c;
				break;
		}
		break;
	case editor_column_type.path:
		break;
}
