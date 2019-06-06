/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

enemy_rotate();
enemy_move_circle();

for(var c = 0; c < array_length_1d(lasers); c++) {
	lasers[c].image_angle += w_spd*dt;
	lasers[c].x = x + 10*cos(lasers[c].image_angle*pi/180);
	lasers[c].y = y - 10*sin(lasers[c].image_angle*pi/180);
}