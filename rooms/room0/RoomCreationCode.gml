var c =  min(display_get_height()/720, display_get_width()/1280);
c*=7/8;
window_set_size(c*1280, c*720);

window_set_position((display_get_width()-c*1280)/2, (display_get_height()-c*720)/2); 

room_goto(room_tutorial1_sprint);

enum shape { //collision shapes
	circle,
	rectangle,
	length
}