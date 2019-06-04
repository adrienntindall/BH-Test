///enemy_place_circle(border)
///@param allowed_tm

if(r == 0) show_debug_message("Note: Trying to place an enemy that moves in a circle of radius 0");

while(true) {
	if(t == 190) instance_destroy();
	else if(wall_collision(argument0, id, r*cos(t/30), -r*sin(t/30))) {
		t++;
		continue;
	}
	t/=30;
	break;
}