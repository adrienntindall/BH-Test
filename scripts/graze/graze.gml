///graze(set_time)
///@param set_time
var cx = min(abs(obj_player.bbox_left-bbox_right),abs(obj_player.bbox_right-bbox_left))-1;
var cy = min(abs(obj_player.bbox_top-bbox_bottom),abs(obj_player.bbox_bottom-bbox_top))-1; 
var dist = cx*cx + cy*cy; //square distance
if(instance_exists(parent) && parent.charged) dist /= 1.2;
if(argument0) grtime = dist/obj_player.grps;
else return dist/obj_player.grps;