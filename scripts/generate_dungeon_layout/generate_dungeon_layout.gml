///generate_dungeon_layout(splits, min_path_length)

var splits = argument0;
var mpl = argument1;

//Generate Room Borders
rx1[0] = 0;
rx2[0] = 0;
ry1[0] = 0;
ry2[0] = 0;
rpath[0] = 1;
rn = 0;
split_room(1, 1, floor(room_width/64)-1, floor(room_height/64)-1, splits, 1);

//Put stuff in room borders
var sroom_set = false;
while(true) {	
	var pbroom, psroom, ptroom;
	var pbrc = 0, psrc = 0, ptrc = 0;
	for(var c = 0; c < rn; c++) {
		var dx = rx2[c]-rx1[c];
		var dy = ry2[c]-ry1[c];
		if((dx > 16) && (dy > 16)) {
			pbroom[pbrc] = c;
			pbrc++;
		}
		if((dx < 10) && (dy > 14)) {
			ptroom[ptrc] = c;
			ptrc++;
		}
		if((dx > 7) && (dy > 7)) {
			psroom[psrc] = c;
			psrc++;
		}
	}
	if((pbrc == 0) || (psrc == 0)) {
		rn = 0;
		split_room(1, 1, floor(room_width/64)-1, floor(room_height/64)-1, splits, 1);	
		continue;
	}
	var broom_id = pbroom[floor(random(pbrc))];
	var sroom_id = psroom[floor(random(psrc))];
	if (broom_id == sroom_id) {
		if(pbrc == 1 && psrc == 1) {
			rn = 0;
			split_room(1, 1, floor(room_width/64)-1, floor(room_height/64)-1, splits, 1);
			continue;
		}
		else if(psrc == 1) while(broom_id == sroom_id) broom_id = pbroom[floor(random(pbrc))];
		else while(broom_id == sroom_id) sroom_id = psroom[floor(random(psrc))];
	}
	//Placing Boss Room
	var x3, x4, y3, y4;
	x3 = random(rx2[broom_id]-rx1[broom_id]-11) + rx1[broom_id]+1;
	x4 = x3+10;
	y3 = random(ry2[broom_id]-ry1[broom_id]-11) + ry1[broom_id]+1;
	y4 = y3+10;
	for(var xx = x3; xx < x4+1; xx++) {
		for(var yy = y3; yy < y4+1; yy++) {
			tilemap_set(map_id, floor_tile, xx, yy);
		}
	}
	var b = instance_create_depth(64*(x3+5), 64*(y3+5), 1, boss);
	b.image_xscale = 5;
	b.image_yscale = 5;
	broom_x1 = 64*x3; broom_x2 = 64*x4; 
	broom_y1 = 64*y3; broom_y2 = 64*y4;
	
	//Placing Starting Room
	x3 = random(rx2[sroom_id]-rx1[sroom_id]-6) + rx1[sroom_id] + 1;
	x4 = x3 + 5;
	y3 = random(ry2[sroom_id]-ry1[sroom_id]-6) + ry1[sroom_id] + 1;
	y4 = y3 + 5;
	for(var xx = x3; xx < x4+1; xx++) {
		for(var yy = y3; yy < y4+1; yy++) {
			tilemap_set(map_id, floor_tile, xx, yy);
		}
	}
	sroom_x1 = 64*x3; sroom_x2 = 64*x4;
	sroom_y1 = 64*y3; sroom_y2 = 64*y4;
	
	//Placing Every Other Room
	for(var c = 0; c < rn; c++) if((c != sroom_id) && (c != broom_id)) {
		var dx = rx2[c]-rx1[c];
		var dy = ry2[c]-ry1[c];
		var max_size = .3*dx*dy;
		var min_size = .15*dx*dy;
		var size = max_size+1;
		var x3, x4, y3, y4;
		while(size > max_size || size < min_size) {
			x3 = random(dx-2)+rx1[c]+1;
			x4 = random(rx2[c]-x3-2)+x3+1;
			var ddx = x4-x3;
			y3 = random(dy-2)+ry1[c]+1;
			y4 = random(abs(ry2[c]-y3)-2)+y3+1;
			var ddy = y4-y3;
			size = (ddx > 4 && ddy > 4) ? ddx*ddy : max_size+1;
		}
		for(var xx = x3; xx < x4+1; xx++) {
			for(var yy = y3; yy < y4+1; yy++) {
				tilemap_set(map_id, floor_tile, xx, yy);
			}
		}
		var m = round(.02*size);
		for(var r = 0; r < m; r++) {
			while(true) {
				var ex = random(dx) + rx1[c];
				var ey = random(dy) + ry1[c];
				if(tilemap_get(map_id, ex, ey) != floor_tile) continue;
				break;
			}
			var e = instance_create_depth(ex*64, ey*64, 1, enemies[floor(random(array_length_1d(enemies)))]);
			e.rx1 = x3*64;
			e.rx2 = x4*64;
			e.ry1 = y3*64;
			e.ry2 = y4*64;
		}
	}
	
	//H A L L W A Y S
	while(true) {
		/*var croom = sroom_id;
		var path;
		var con = false;
		path[0] = croom;
		var curpath = rpath[croom];
		var v = 1;
		var temp = rpath[broom_id];
		var brd = 0; while(temp != 1) { brd++; temp = floor(temp/10); }
		var temp = rpath[croom];
		var srd = 0; while(temp != 1) { srd++; temp = floor(temp/10); }
		var pdir = (rpath[croom] == 1); //0 going down; 1 going up
		var root = 1;
		temp = rpath[croom]; var tempy = rpath[broom_id];
		temp = (temp > tempy) ? floor(temp/(power(10,(srd-brd)))) : temp;
		tempy = (temp > tempy) ? tempy : floor(tempy/(power(10,(brd-srd))));
		while(temp != tempy) { temp = floor(temp/10); tempy = floor(tempy/10); }
		root = temp;
		if (root != 1) root = floor(root/10);
		var rd = 0; while(temp != 1) { rd++; temp = floor(temp/10); }
		while(curpath != root) {
			curpath = floor(curpath/10);
			if(findIndex(curpath, rpath) != -1) {
				path[v] = findIndex(curpath, rpath);
				v++;
			}
		}
		var curdx = brd-rd;
		while(curdx != 0) {
			curpath = floor(rpath[broom_id]/(power(10,curdx)))
			if(findIndex(curpath, rpath)) {
				path[v] = findIndex(curpath, rpath);
				v++;
			}
			curdx--;
		}
		path[v] = broom_id;*/
		var graph;
		for(var z = 0; z < rn; z++) {
			var cnxs;
			cnxs[0] = -1;
			var p = 0;
			for(var w = z; w < rn; w++) {
				if(((rx1[w] == rx2[z]) || (rx2[w] == rx1[z])) 
					|| ((ry1[w] == ry2[z]) || (ry2[w] == ry1[z]))) {
					cnxs[p] = w;		
				}
			}
			graph[z] = cnxs;
		}
		for(var w = 0; w < array_length_1d(graph)-1; w++) {
			var cnxs = graph[w];
			for(var z = 0; (z < array_length_1d(cnxs)) && (cnxs[0] != -1); z++) {
				var xtop, xbot, ytop, ybot;
				var za = w;
				var zb = cnxs[z];
				while(true) {
					xtop = floor(random(rx2[za]-rx1[za]) + rx1[za]);
					xbot = floor(random(rx2[zb]-rx1[zb]) + rx1[zb]);
					ytop = floor(random(ry2[za]-ry1[za]) + ry1[za]);
					ybot = floor(random(ry2[zb]-ry1[zb]) + ry1[zb]);
				
					if((tilemap_get(map_id, xtop, ytop) != floor_tile)
						|| (tilemap_get(map_id, xbot, ybot) != floor_tile)) continue;
				
					var cruxx, cruxy;
					var dir = round(random(1));
					while(true) {
						cruxx = floor(random(abs(xtop-xbot)) + min(xtop, xbot));
						cruxy = floor(random(abs(ytop-ybot)) + min(ytop, ybot));
						var con = false;
						if(tilemap_get(map_id, cruxx, cruxy) == floor_tile) break;
						else {
							for(var a = -1; a < 2; a++) for(var b = -1; b < 2; b++) {
								if(tilemap_get(map_id, cruxx+a, cruxy+b) == floor_tile) con = true;
								if(tilemap_get(map_id, (dir ? cruxx : xtop) + a, (dir ? ytop : cruxy)+b) == floor_tile) con = true;
								if(tilemap_get(map_id, (dir ? xbot : cruxx)+a, (dir ? cruxy : ybot)+b) == floor_tile) con = true;
							}
						}
						if(con) continue
						break;
					}
					paint_line(dir ? xtop : ytop, dir ? cruxx : cruxy, dir ? ytop : xtop, dir, map_id, floor_tile);
					//go from (xtop, ytop) -> (cruxx, ytop) or (xtop, cruxy)
					paint_line(dir ? ytop : xtop, dir ? cruxy : cruxx, dir ? cruxx : cruxy, !dir, map_id, floor_tile); 
					//go from (cruxx, ytop) or (xtop, cruxy) -> (cruxx, cruxy)
					paint_line(dir ? cruxx : cruxy, dir ? xbot : ybot, dir ? cruxy : cruxx, dir, map_id, floor_tile);
					//go from (cruxx, cruxy) -> (xbot, cruxy) or (cruxx, ybot)
					paint_line(dir ? cruxy : cruxx, dir ? ybot : xbot, dir ? xbot : ybot, !dir, map_id, floor_tile);
					//go from (xbot, cruxy) or (cruxx, ybot) -> (xbot, ybot)
					break;
				}
			}
		}
		break;
	}
	break;
}

for(var a = 0; a < floor(room_width/64); a++) {
	for(var b = 0; b < floor(room_height/64); b++) {
		if(tilemap_get(map_id, a, b) != floor_tile) {
			tilemap_set(bmap_id, border_tile, a, b);	
		}
	}
}


//Generating walls to make things nice™
for(var a = 0; a < floor(room_width/64); a++) {
	for(var b = 0; b < floor(room_height/64); b++) if(tilemap_get(map_id, a, b) != floor_tile) {
		var bn = (b == 0); var bs = (b ==floor(room_height/64)-1);
		var ae = (a == floor(room_width/64)-1); var aw = (a == 0);
		var n = (bn ? false : (tilemap_get(map_id, a, b-1) == floor_tile));
		var s = (bs ? false : (tilemap_get(map_id, a, b+1) == floor_tile));
		var e = (ae ? false : (tilemap_get(map_id, a+1, b) == floor_tile));
		var w = (aw ? false : (tilemap_get(map_id, a-1, b) == floor_tile));
		var ne = ((bn || ae) ? false : (tilemap_get(map_id, a+1, b-1) == floor_tile));
		var se = ((bs || ae) ? false : (tilemap_get(map_id, a+1, b+1) == floor_tile));
		var nw = ((bn || aw) ? false : (tilemap_get(map_id, a-1, b-1) == floor_tile));
		var sw = ((bs || aw) ? false : (tilemap_get(map_id, a-1, b+1) == floor_tile));
		var cur_layer = 0;
		if(n) {
			if(s) {
				if(e) {
					if(w) tilemap_set(map_id, wall_nsew, a, b);
					else tilemap_set(map_id, wall_corn_nse, a, b);
				}
				else if(w) tilemap_set(map_id, wall_corn_nsw, a, b);
				else {
					tilemap_set(map_id, wall_n, a, b);
					tilemap_set(layers[1], wall_s, a, b);
					cur_layer++;
				}
			}
			else if(e) {
				if(w) tilemap_set(map_id, wall_corn_ewn, a, b);
				else tilemap_set(map_id, wall_corn_ne, a, b);
			}
			else if(w) tilemap_set(map_id, wall_corn_nw, a, b);
			else tilemap_set(map_id, wall_n, a, b);
			cur_layer++;
		}
		else if(s) {
			if(e) {
				if(w) tilemap_set(map_id, wall_corn_ews, a, b);
				else tilemap_set(map_id, wall_corn_se, a, b);
			}
			else if(w) tilemap_set(map_id, wall_corn_sw, a, b);
			else tilemap_set(map_id, wall_s, a, b);
			cur_layer++;
		}
		else if(e) {
			if(w) {
				tilemap_set(map_id, wall_e, a, b);
				tilemap_set(layers[1], wall_w, a, b);
				cur_layer++;
			}
			else tilemap_set(map_id, wall_e, a, b);
			cur_layer++;
		}
		else if(w) { tilemap_set(map_id, wall_w, a, b); cur_layer++; }
		if(ne && !(n || e)) { tilemap_set(layers[cur_layer], corn_ne, a, b); cur_layer+=1; }
		if(se && !(s || e)) { tilemap_set(layers[cur_layer], corn_se, a, b); cur_layer+=1; }
		if(nw && !(n || w)) { tilemap_set(layers[cur_layer], corn_nw, a, b); cur_layer+=1; }
		if(sw && !(s || w)) { tilemap_set(layers[cur_layer], corn_sw, a, b); cur_layer+=1; }
	}
}