///orientation(px, py, qx, qy, zx, zx) 
///@param px
///@param py
///@param qx
///@param qy
///@param zx
///@param zy
var px = argument0; var py = argument1;
var qx = argument2; var qy = argument3;
var zx = argument4; var zy = argument5;
val = (qy - py) * (zx - qx) - (qx - px) * (zy - qy); 
if (val == 0) return 0; // colinear 
return (val > 0) ? 1: 2; // clock or counterclock wise 