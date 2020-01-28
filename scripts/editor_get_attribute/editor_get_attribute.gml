///editor_get_attribute(col, variable, id)
///@param col
///@param var
///@param id

var obj = argument2;
var bullet = obj.bullet;

switch(argument0) {
	case editor_column_type.spawn:
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
		break;
}
