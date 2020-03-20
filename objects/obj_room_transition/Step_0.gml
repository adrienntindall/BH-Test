/// @description Insert description here
// You can write your code in this editor
if(panning) {
	with(obj_room_transition) {
		if(trans_id == other.trans_id && id != other.id) {
			switch(dir){
				case trans_dir.north:
					obj_player.y = bbox_top - 16;
					obj_player.x = bbox_left + other.xoff;
					break;
				case trans_dir.south:
					obj_player.y = bbox_bottom + 16;
					obj_player.x = bbox_left + other.xoff;
					break;
			}
			obj_camera.x = obj_player.x;
			obj_camera.y = obj_player.y;
		}
	}	
	panning = false;
	instance_destroy();
}