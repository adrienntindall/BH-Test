/// @description Insert description here
// You can write your code in this editor
var minh = 0, minw = 0;
var maxh = 0, maxw = 0;
var fmh = false, fmw = false;
for(var h = 0; h < 16; h++) {
	for(var w = 0; w < 16; w++) {
		if(tilemap_get(map_id, w+6, h) == floor_tile) {
			if(!fmw) { minw = w; fmw = true; }
			if(!fmh) { minh = h; fmh = true; }
			minw = min(minw, w);
			minh = min(minh, h);
			maxw = max(maxw, w);
			maxh = max(maxh, h);
		}
	}
}
var dh = maxh-minh+1;
var dw = maxw-minw+1;
var chart = "";
for(var h = 0; h < dh; h++) {
	for(var w = 0; w < dw; w++) {
		if(tilemap_get(map_id, w+minw+6, h+minh) == floor_tile) {
			chart += "1";
		}
		else chart += "0";
		if((dh != dh-1) && (dw != dw-1)) chart += ",";
	}
}
file = file_text_open_write(working_directory+"exported_rooms.txt");
file_text_write_string(file, @"
//New Room
var cx1 = rx1[c]; var cx2 = rx2[c]; var cy1 = ry1[c]; var cy2 = ry2[c];
var f = 0;
var chart = array("+chart+@");
var dx = cx2-cx1; var dy = cy2-cy1;
var sx = floor(random(dx-1-"+string(dw)+@"))+1+cx1;
var sy = floor(random(dy-1-"+string(dh)+@"))+1+cy1;;
for(var q = 0; q < " + string(dh) + @"; q++) {
	for(var l = 0; l < " + string(dw) + @"; l++) {
		if(chart[f] == 1) {
			tilemap_set(map_id, floor_tile, sx+l, sy+q);
		}
		f++;
	}
}
");
file_text_close(file);