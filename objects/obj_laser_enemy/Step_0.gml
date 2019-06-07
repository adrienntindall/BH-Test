/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(interval == -1 || tf - tb < interval) {
	tf += dt*spd;
}
else {
	tf += dt*spd;
	tb += dt*spd;
}