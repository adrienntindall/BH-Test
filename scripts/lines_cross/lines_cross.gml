///lines_cross(px1, py1, px2, py2, qx1, qy1, qx2, qy2)
///@param px1
///@param py1
///@param px2
///@param py2
///@param qx1
///@param qy1
///@param qx2
///@param qy2

var px1 = argument0; var py1 = argument1; var px2 = argument4; var py2 = argument5;
var qx1 = argument2; var qy1 = argument3; var qx2 = argument6; var qy2 = argument7;

// The main function that returns true if line segment 'p1q1' 
// and 'p2q2' intersect. 
// Find the four orientations needed for general and 
// special cases 
var o1 = orientation(px1, py1, qx1, qy1, px2, py2); 
var o2 = orientation(px1, py1, qx1, qy1, qx2, qy2); 
var o3 = orientation(px2, py2, qx2, qy2, px1, py1); 
var o4 = orientation(px2, py2, qx2, qy2, qx1, qy1); 

// General case 
if (o1 != o2 && o3 != o4) 
	return true; 

// Special Cases 
// p1, q1 and p2 are colinear and p2 lies on segment p1q1 
if (o1 == 0 && on_segment(px1, py1, px2, py2, qx1, qy1)) return true; 

// p1, q1 and q2 are colinear and q2 lies on segment p1q1 
if (o2 == 0 && on_segment(px1, py1, qx2, qy2, qx1, qy2)) return true; 

// p2, q2 and p1 are colinear and p1 lies on segment p2q2 
if (o3 == 0 && on_segment(px2, py2, px1, py1, qx2, qy2)) return true; 

// p2, q2 and q1 are colinear and q1 lies on segment p2q2 
if (o4 == 0 && on_segment(px2, py2, qx1, qy1, qx2, qy2)) return true; 

return false; // Doesn't fall in any of the above cases 