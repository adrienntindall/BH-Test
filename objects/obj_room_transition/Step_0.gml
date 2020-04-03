/// @description Insert description here
// You can write your code in this editor
if(panning) {
	with(obj_room_transition) {
		if(trans_id == other.trans_id && id != other.id) {
			switch(dir){
				case trans_dir.north:
					obj_player.y = bbox_top - 32;
					obj_player.x = bbox_left + other.xoff;
					
					break;
				case trans_dir.south:
					obj_player.y = bbox_bottom + 32;
					obj_player.x = bbox_left + other.xoff;
					break;
				case trans_dir.east:
					obj_player.x = bbox_right + 32;
					obj_player.y = bbox_top + other.yoff;
					break;
				case trans_dir.west:
					obj_player.x = bbox_left - 32;
					obj_player.y = bbox_top + other.yoff;
					break;
			}
			obj_camera.x = obj_player.x;
			obj_camera.y = obj_player.y;
			obj_camera.pan_x = obj_player.x-obj_camera.def_width/2;
			if(dir == trans_dir.north || trans_dir.south) with(obj_camera) {
				if(pan_x > room_width - def_width) pan_x = room_width - def_width;
				if(pan_x < 0) pan_x = 0;
			}
			obj_camera.pan_y = obj_player.y-obj_camera.def_height/2;
			if(dir == trans_dir.east || dir == trans_dir.west) with(obj_camera) {
				if(pan_y > room_height - def_height) pan_y = room_height - def_height;
				if(pan_y < 0) pan_y = 0;
			}
			obj_camera.pan_dir = dir;
		}
	}	
	panning = false;
	obj_camera.pan = true;
	
	instance_destroy();
}
else if(dest_next_frame) instance_destroy();