/// @description Insert description here
// You can write your code in this editor
if(!tag) dt = global.dt;

switch(pattern) {
	case move_pat.linear:
		move_linear();
		break;
	case move_pat.linear_lazer:
		move_lazer_linear();
		break;
}