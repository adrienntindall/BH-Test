/// @description Insert description here
// You can write your code in this editor
var dt = global.dt;

switch(mov_pat) {
	case wp_mv.linear:
		move_linear();
		break;
	default:
		show_debug_message("Note, bullet move pattern " + string(mov_pat) + " is not yet implemented");
		break;
}

t+=dt;
t0+=dt;
life -= dt;
if (life <= 0) {
	instance_destroy();	
}