/// @description Insert description here
// You can write your code in this editor
r_dest = -1;
trans_id = -1; //The destination obj of the same time must have the same id as this one, otherwise you'll get sent to (0, 0) of the room
dir = -1; //pan direction when the player is coming to the location
xoff = 0;
yoff = 0;
xsoff = 0;
draw_frame0 = false;
panning = false;
dest_next_frame = false;

act = true;

define_rectangle();

enum trans_dir {
	north,
	south,
	east,
	west
};