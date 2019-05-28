///hit_aff(affect)
///@param affect

var dt = global.dt;

switch(argument0) {
	case wp_ex.flame:
		on_fire = true;
		flame_time = 5;
		flame_dmg = 1;
		image_blend = c_red;
		break;
	default:
		break;
}