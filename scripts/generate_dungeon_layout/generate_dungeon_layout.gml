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
ndx[0, 0] = 0; ndy[0, 0] = 0;
sdx[0, 0] = 0; sdy[0, 0] = 0;
edx[0, 0] = 0; edy[0, 0] = 0;
wdx[0, 0] = 0; wdy[0, 0] = 0;
split_room(splits);

//Put stuff in room borders
var sroom_set = false;
while(true) {	
	var pbrc = 0, psrc = 0, ptrc = 0;
	var broom_id, sroom_id;
	while(true) {
		broom_id = floor(random(rn));
		sroom_id = floor(random(rn));
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
	ndx[broom_id, 0] = x3+round((x4-x3)/2); ndy[broom_id, 0] = y3;
	sdx[broom_id, 0] = x3+round((x4-x3)/2); sdy[broom_id, 0] = y4;
	edx[broom_id, 0] = x4; edy[broom_id, 0] = y3+round((y4-y3)/2);
	wdx[broom_id, 0] = x3; wdy[broom_id, 0] = y3+round((y4-y3)/2);
	
	//Placing Starting Room
	x3 = random(rx2[sroom_id]-rx1[sroom_id]-7) + rx1[sroom_id] + 1;
	x4 = x3 + 5;
	y3 = random(ry2[sroom_id]-ry1[sroom_id]-7) + ry1[sroom_id] + 1;
	y4 = y3 + 5;
	for(var xx = x3; xx < x4+1; xx++) {
		for(var yy = y3; yy < y4+1; yy++) {
			tilemap_set(map_id, floor_tile, xx, yy);
		}
	}
	sroom_x1 = 64*x3; sroom_x2 = 64*x4;
	sroom_y1 = 64*y3; sroom_y2 = 64*y4;
	ndx[sroom_id, 0] = x3+round((x4-x3)/2); ndy[sroom_id, 0] = y3;
	sdx[sroom_id, 0] = x3+round((x4-x3)/2); sdy[sroom_id, 0] = y4;
	edx[sroom_id, 0] = x4; edy[sroom_id, 0] = y3+round((y4-y3)/2);
	wdx[sroom_id, 0] = x3; wdy[sroom_id, 0] = y3+round((y4-y3)/2);
	
	//Placing Every Other Room
	for(var c = 0; c < rn; c++) if((c != sroom_id) && (c != broom_id)) {
		//New Room
		var cx1 = rx1[c]; var cx2 = rx2[c]; var cy1 = ry1[c]; var cy2 = ry2[c];
		var f = 0;
		var chart = array(0,1,1,1,0,0,0,1,1,1,0,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,);
		var nds = array(2,1,8,1); var sds = array(5,9); var eds = array(10,3,10,4); var wds = array(0,3,0,4);
		var dx = cx2-cx1; var dy = cy2-cy1;
		var sx = floor(random(dx-1-11))+1+cx1;
		var sy = floor(random(dy-1-10))+1+cy1;
		for(var q = 0; q < array_length_1d(nds)/2; q++) { ndx[c, q] = sx+nds[2*q]; ndy[c, q] = sy+nds[2*q+1]; }
		for(var q = 0; q < array_length_1d(sds)/2; q++) { sdx[c, q] = sx+sds[2*q]; sdy[c, q] = sy+sds[2*q+1]; }
		for(var q = 0; q < array_length_1d(eds)/2; q++) { edx[c, q] = sx+eds[2*q]; edy[c, q] = sy+eds[2*q+1]; }
		for(var q = 0; q < array_length_1d(wds)/2; q++) { wdx[c, q] = sx+wds[2*q]; wdy[c, q] = sy+wds[2*q+1]; }
		for(var q = 0; q < 10; q++) {
			for(var l = 0; l < 11; l++) {
				if(chart[f] == 1) {
					tilemap_set(map_id, floor_tile, sx+l, sy+q);
				}
				f++;
			}
		}


		//var m = round(.02*size);
		var m = 1;
		for(var r = 0; r < m; r++) {
			while(true) {
				var ex = random(rx2[c]-rx1[c]) + rx1[c];
				var ey = random(ry2[c]-ry1[c]) + ry1[c];
				if(tilemap_get(map_id, ex, ey) != floor_tile) continue;
				break;
			}
			var e = instance_create_depth(ex*64, ey*64, 1, enemies[floor(random(array_length_1d(enemies)))]);
			e.rx1 = rx1[c]*64;
			e.rx2 = rx2[c]*64;
			e.ry1 = ry1[c]*64;
			e.ry2 = ry2[c]*64;
		}
	}
	
	//H A L L W A Y S
	while(true) {
		var graph;
		graph[0, 0] = 0;
		//max hallways
		for(var z = 0; z < rn; z++) {
			graph[z, 0] = -1; 
			for(var w = 0; w < rn; w++) {
				var xw1 = rx1[w], xw2 = rx2[w], xz1 = rx1[z], xz2 = rx2[z];
				var yw1 = ry1[w], yw2 = ry2[w], yz1 = ry1[z], yz2 = ry2[z];
				var bordx = (xw1 == xz2) || (xw2 == xz1);
				var bordy = (yw1 == yz2) || (yw2 == yz2);
				var samex = (xw1 == xz1) || (xw2 == xz2);
				var samey = (yw1 == yz1) || (yw2 == yz2);
				if(((w == broom_id) && (z == sroom_id)) || ((w == sroom_id) && (z == broom_id))) cnxs[w] = -1;
				else if((bordx && samey) || (bordy && samex)) {
					//1 - Borders n, 2 - s, 3 - e, 4 - w
					graph[z, w] = (w < z) ? 0 : (bordx ? ((xw1==xz2) ? 3 : 4) : ((yw1==yz2) ? 2 : 1));
				}
				else {
					graph[z, w] = -1;
				}
				if((w+1) == z) { graph[z, z] = -1; w++; }
			}
		}
		//cutting down on the hallways
		/*for(var w = 0; w < array_length_1d(graph)-1; w++) {
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
					for(var d = 0; d < p; d++)  {
						if(destroid[d] == 1) {
							var gud = graph[carr[d]];
							var temp = 0;
							for(var q = 0; q < array_length_1d(gud); q++) { gud[q] = gud[q]; if(gud[q] != -1) temp++; }
							if(temp > 1) {
								cnxs[carr[d]] = -1;
								gud[w] = -1;
								graph[carr[d]] = gud;
							}
						}
						else {
							cnxs[carr[d]] = cnxs[carr[d]];	
						}
					}
					break;
				}
				graph[w] = cnxs;
			}
			else if(p == 0) {
				cnxs[floor(random(array_length_1d(cnxs)))] = 1;
				graph[w] = cnxs
			}
		}*/
		for(var w = 0; w < array_length_1d(graph)-1; w++) {
			for(var z = 0; (z < array_length_2d(graph, w)); z++) {
				if(graph[w, z] >= 1) {
					var xtop, xbot, ytop, ybot;
					while(true) {
						switch(graph[w, z]) {
							case 1: //North
								var dtop = floor(random(array_length_2d(ndx, w)));
								var dbot = floor(random(array_length_2d(sdx, z)));
								xtop = ndx[w, dtop]; ytop = ndy[w, dtop];
								xbot = sdx[z, dbot]; ybot = sdy[z, dbot];
								break;
							case 2: //South
								var dtop = floor(random(array_length_2d(sdx, w)));
								var dbot = floor(random(array_length_2d(ndx, z)));
								xtop=sdx[w, dtop]; ytop = sdy[w, dtop];
								xbot = ndx[z, dbot]; ybot = ndy[z, dbot];
								break;
							case 3: //East
								var dtop = floor(random(array_length_2d(edx, w)));
								var dbot = floor(random(array_length_2d(wdx, z)));
								xtop=edx[w, dtop]; ytop = edy[w, dtop];
								xbot = wdx[z, dbot]; ybot = wdy[z, dbot];
								break;
							case 4: //West
								var dtop = floor(random(array_length_2d(wdx, w)));
								var dbot = floor(random(array_length_2d(edx, z)));
								xtop=wdx[w, dtop]; ytop = wdy[w, dtop];
								xbot = edx[z, dbot]; ybot = edy[z, dbot];
								break;
							default:
								break;
						}
						
						var crux;
						var dir = graph[w, z] > 2;
						while(true) {
							crux = dir ? floor(random(abs(xtop-xbot)-4) + min(xtop, xbot)+2)
										: floor(random(abs(ytop-ybot)-4) + min(ytop, ybot)+2);
							var con = false;
							/*if(tilemap_get(map_id, cruxx, cruxy) == floor_tile) break;
							else {
								for(var a = -1; a < 2; a++) for(var b = -1; b < 2; b++) {
									if(tilemap_get(map_id, cruxx+a, cruxy+b) == floor_tile) con = true;
									if(tilemap_get(map_id, (dir ? cruxx : xtop) + a, (dir ? ytop : cruxy)+b) == floor_tile) con = true;
									if(tilemap_get(map_id, (dir ? xbot : cruxx)+a, (dir ? cruxy : ybot)+b) == floor_tile) con = true;
								}
							}*/
							if(con) continue
							break;
						}
						paint_line(dir ? xtop : ytop, crux, dir ? ytop : xtop, dir, map_id, floor_tile);
						//go from (xtop, ytop) -> (crux, ytop) or (xtop, crux)
						paint_line(dir ? ytop : xtop, dir ? ybot : xbot, crux, !dir, map_id, floor_tile);
						//go from (crux, ytop) or (xtop, crux) -> (crux, ybot) or (xbot, crux)
						paint_line(crux, dir ? xbot : ybot, dir ? ybot : xbot, dir, map_id, floor_tile);
						//go from (xbot, crux) or (crux, ybot) -> (xbot, ybot)
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