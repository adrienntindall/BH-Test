///onSegment(x1, y1, x2, y2, x3, y3) 
///@param px
///@param py
///@param x1
///@param y1
///@param x2
///@param y2
var x1 = argument0; var y1 = argument1;
var x2 = argument2; var y2 = argument3;
var x3 = argument4; var y3 = argument5;
if (x1 <= max(x2, x3) && x1 >= min(x2, x3) && 
		y1 <= max(y2, y3) && y1 >= min(y2, y3)) 
	return true; 
return false;