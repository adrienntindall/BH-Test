var s = 1.5;
window_set_size(s*room_width, s*room_height);
view_wport[0] = s*room_width;
view_hport[0] = s*room_height;

var p = instance_create_depth(room_width/2 + 25, room_height/2 + 25, 1, obj_player);

p.boss_defeated = true;