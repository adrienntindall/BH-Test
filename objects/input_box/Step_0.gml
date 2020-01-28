/// @description Insert description here
// You can write your code in this editor
if(mouse_check_button_pressed(mb_left) && 
(mouse_x >= x) && (mouse_x <= x+width) && (mouse_y >= y-height/2) && (mouse_y <= y+height/2)) {
	isTyping = true;
	keyboard_string = string(value);
}
else if(mouse_check_button_pressed(mb_left)) {
	isTyping = false;
}

if(isTyping) {
	if(keyboard_string == "0-") keyboard_string = "-0";
	if(keyboard_string == "" || keyboard_string == "-") keyboard_string = "0";
	value = real(keyboard_string);
}