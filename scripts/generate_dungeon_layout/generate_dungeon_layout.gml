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
split_room(splits);

//Put stuff in room borders
var sroom_set = false;
while(true) {	
	var pbroom, psroom, ptroom;
	var pbrc = 0, psrc = 0, ptrc = 0;
	var broom_id, sroom_id;
	while(true) {
		broom_id = floor(random(array_length_1d(ry1)));
		sroom_id = floor(random(array_length_1d(ry1)));
		if(broom_id == sroom_id) continue;
		break;
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
		var graph;
		//max hallways
		for(var z = 0; z < rn; z++) {
			var cnxs;
			cnxs[0] = -1;
			for(var w = 0; w < rn; w++) {
				var xw1 = rx1[w], xw2 = rx2[w], xz1 = rx1[z], xz2 = rx2[z];
				var yw1 = ry1[w], yw2 = ry2[w], yz1 = ry1[z], yz2 = ry2[z];
				if(((w == broom_id) && (z == sroom_id)) || ((w == sroom_id) && (z == broom_id))) cnxs[w] = -1;
				else if(((xw1 == xz2) || (xw2 == xz1)) 
					|| ((yw1 == yz2) || (yw2 == yz2))) {
					cnxs[w] = (w < z) ? 0 : 1;
				}
				else {
					cnxs[w] = -1;
				}
				if((w+1) == z) w++;
			}
			graph[z] = cnxs;
		}
		//cutting down on the hallways
		for(var w = 0; w < array_length_1d(graph)-1; w++) {
			var cnxs = graph[w];
			cnxs[w] = -1;
			var ccnt = 0;
			var carr;
			var p = 0;
			for(var z = 0; (z < array_length_1d(cnxs)); z++) if(cnxs[z] != -1) {
				ccnt++;
				carr[p] = z;
				p++;
			}
			if(p > 1) {
				while(true) {
					var destroid;
					for(var d = 0; d < p; d++) destroid[d] = (random(1) > .33) ? 1 : 0;
					var flag = true;
					for(var d = 0; d < p; d++) if(destroid[d] == 1) flag = false;
					if(flag) continue;
					for(var d = 0; d < p; d++) cnxs[carr[d]] = (destroid[d]) ? cnxs[carr[d]] : -1;
					break;
				}
				graph[w] = cnxs;
			}
			else if(p == 0) {
				cnxs[floor(random(array_length_1d(cnxs)))] = 1;
				graph[w] = cnxs
			}
		}
		for(var w = 0; w < array_length_1d(graph)-1; w++) {
			var cnxs = graph[w];
			for(var z = 0; (z < array_length_1d(cnxs)); z++) {
				if(cnxs[z] == 1) {
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