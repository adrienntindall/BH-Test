/// @description Insert description here
// You can write your code in this editor

draw_rectangle_color(x, y-height/2, x+width, y+height/2, c_black, c_green, c_orange, c_blue, false);
draw_text_transformed_color(x+10, y, string(value) + (isTyping ? "|" : ""), .55, .55, 0, c_white, c_white, c_white, c_white, 1);