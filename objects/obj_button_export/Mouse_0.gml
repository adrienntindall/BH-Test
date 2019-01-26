/// @description Insert description here
// You can write your code in this editor
var minh = 0, minw = 0;
var maxh = 0, maxw = 0;
var fmh = false, fmw = false;
for(var h = 0; h < size; h++) {
	for(var w = 0; w < size; w++) {
		if(tilemap_get(map_id, w+12, h) != 0) {
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
var nd = "", sd = "", ed = "", wd = "";
for(var h = 0; h < dh; h++) {
	for(var w = 0; w < dw; w++) {
		if(tilemap_get(map_id, w+minw+12, h+minh) != 0) {
			chart += "1";
		}
		else chart += "0";
		switch(tilemap_get(map_id, w+minw+12, h+minh)) {
			case ndoor:
				nd += ((nd == "") ? "" : ",") + string(w) + "," + string(h);
				break;
			case sdoor:
				sd += ((sd == "") ? "" : ",") + string(w) + "," + string(h);
				break;
			case edoor:
				ed += ((ed == "") ? "" : ",") + string(w) + "," + string(h);
				break;
			case wdoor:
				wd += ((wd == "") ? "" : ",") + string(w) + "," + string(h);
				break;
			default:
				break;
		}
		if((dh != dh-1) && (dw != dw-1)) chart += ",";
	}
}
file = file_text_open_write(working_directory+"exported_rooms.txt");
file_text_write_string(file, @"//New Room
var cx1 = rx1[c]; var cx2 = rx2[c]; var cy1 = ry1[c]; var cy2 = ry2[c];
var f = 0;
var chart = array("+chart+@");
var nds = array("+nd+@"); var sds = array("+sd+@"); var eds = array("+ed+@"); var wds = array("+wd+@");
var dx = cx2-cx1; var dy = cy2-cy1;
var sx = floor(random(dx-1-"+string(dw)+@"))+1+cx1;
var sy = floor(random(dy-1-"+string(dh)+@"))+1+cy1;
for(var q = 0; q < array_length_1d(nds)/2; q++) { ndx[c, q] = sx+nds[2*q]; ndy[c, q] = sy+nds[2*q+1]; }
for(var q = 0; q < array_length_1d(sds)/2; q++) { sdx[c, q] = sx+sds[2*q]; sdy[c, q] = sy+sds[2*q+1]; }
for(var q = 0; q < array_length_1d(eds)/2; q++) { edx[c, q] = sx+eds[2*q]; edy[c, q] = sy+eds[2*q+1]; }
for(var q = 0; q < array_length_1d(wds)/2; q++) { wdx[c, q] = sx+wds[2*q]; wdy[c, q] = sy+wds[2*q+1]; }
for(var q = 0; q < " + string(dh) + @"; q++) {
	for(var l = 0; l < " + string(dw) + @"; l++) {
		if(chart[f] == 1) {
			tilemap_set(map_id, floor_tile, sx+l, sy+q);
		}
		f++;
	}
}
var fow = instance_create_depth(64*(sx-.5), 64*(sy-.5), 0, obj_fow);
fow.image_xscale = "+string(dh)+@"+1;
fow.image_yscale = "+string(dw)+@"+1;
");
file_text_close(file);