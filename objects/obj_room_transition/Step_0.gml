/// @description Insert description here
// You can write your code in this editor
if(panning) {
	with(obj_room_transition) {
		if(trans_id == other.trans_id && id != other.id) {
			switch(dir){
				case trans_dir.north:
					obj_player.y = bbox_top - 32;
					obj_player.x = bbox_left + other.xoff;
					obj_camera.pan_yv = (obj_camera.def_height + other.ysoff - (room_height - bbox_top))/obj_camera.pan_time;
					obj_camera.pan_pyv = (obj_camera.def_height - (room_height - (bbox_top - 32)) - (other.ysoff - other.yoff))/obj_camera.pan_time;
					obj_camera.pan_px = obj_player.x;
					obj_camera.pan_py = -obj_camera.pan_pyv*obj_camera.pan_time + obj_player.y;
					obj_camera.pan_y = obj_player.y-obj_camera.def_height;
					break;
				case trans_dir.south:
					obj_player.y = bbox_bottom + 32;
					obj_player.x = bbox_left + other.xoff;
					obj_camera.pan_yv = (obj_camera.def_height + bbox_bottom - (other.ysoff))/obj_camera.pan_time;
					obj_camera.pan_pyv = (obj_camera.def_height - (bbox_bottom + 32) - (other.ysoff + other.yoff))/obj_camera.pan_time;
					obj_camera.pan_px = obj_player.x;
					obj_camera.pan_py = obj_camera.pan_pyv*obj_camera.pan_time + obj_player.y;
					obj_camera.pan_y = obj_player.y;
					break;
				case trans_dir.east:
					obj_player.x = bbox_right + 32;
					obj_player.y = bbox_top + other.yoff;
					obj_camera.pan_xv = (obj_camera.def_width - other.xsoff + bbox_right)/obj_camera.pan_time;
					obj_camera.pan_pxv = (obj_camera.def_width-(other.xsoff - other.xoff) - (bbox_right + 32))/obj_camera.pan_time;
					obj_camera.pan_px = obj_camera.pan_pxv*obj_camera.pan_time + obj_player.x;
					obj_camera.pan_py = obj_player.y;
					break;
				case trans_dir.west:
					obj_player.x = bbox_left - 32;
					obj_player.y = bbox_top + other.yoff;
					obj_camera.pan_xv = (obj_camera.def_width + other.xsoff - (room_width - bbox_left))/obj_camera.pan_time;
					obj_camera.pan_pxv = ((bbox_left - 32) - (other.xsoff + other.xoff))/obj_camera.pan_time;
					obj_camera.pan_px = -obj_camera.pan_pxv*obj_camera.pan_time + obj_player.x;
					obj_camera.pan_py = obj_player.y;
					break;
			}
			obj_camera.x = obj_player.x;
			obj_camera.y = obj_player.y;
			obj_camera.pan_x = obj_player.x-obj_camera.def_width/2;
			if(dir == trans_dir.north || trans_dir.south) with(obj_camera) {
				if(pan_x > room_width - def_width) pan_x = room_width - def_width;
				if(pan_x < 0) pan_x = 0;
			}
			
			if(dir == trans_dir.east || dir == trans_dir.west) with(obj_camera) {
				obj_camera.pan_y = obj_player.y-obj_camera.def_height/2;
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