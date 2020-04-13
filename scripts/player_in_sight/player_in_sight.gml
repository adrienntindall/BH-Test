///player_in_sight()

var temp = true;
var tm = layer_tilemap_get_id("Borders");
var dist = dist_to_player();
var ptheta = angle_between(self, obj_player);

for(var c = 0; c < dist/64; c++) {
	if(tilemap_get(tm, center_x(self)/64 + c*cos(ptheta), center_y(self)/64 - c*sin(ptheta)) != 0) {
		temp = false;
		return temp;
	}
}

return temp;