/// @description Removing Doors and Placing Chests
with(obj_door) {
	if(rn == other.cur_room) instance_destroy();	
}
instance_create_depth((rx2+rx1)/2, (ry2+ry1)/2, 1, obj_treasure_chest);
