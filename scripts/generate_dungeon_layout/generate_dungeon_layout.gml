///generate_dungeon_layout(splits, min_path_length)

var size = argument0;
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
split_room(size);

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
	x3 = random(rx2[broom_id]-rx1[broom_id]-(size/2)) + rx1[broom_id]+1;
	x4 = x3+size/2;
	y3 = random(ry2[broom_id]-ry1[broom_id]-(size/2)) + ry1[broom_id]+1;
	y4 = y3+size/2;
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
	x3 = random(rx2[sroom_id]-rx1[sroom_id]-(3*size/8)) + rx1[sroom_id] + 1;
	x4 = x3 + floor(3*size/8)-2;
	y3 = random(ry2[sroom_id]-ry1[sroom_id]-(3*size/8)) + ry1[sroom_id] + 1;
	y4 = y3 + floor(3*size/8)-2;
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
		var chart = array(0,0,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,);
		var nds = array(3,0,4,0,5,0,13,0,14,0,15,0); var sds = array(9,16); var eds = array(18,3,18,4,18,5,18,6); var wds = array(0,3,0,4,0,5,0,6);
		var dx = cx2-cx1; var dy = cy2-cy1;
		var sx = floor(random(dx-1-19))+1+cx1;
		var sy = floor(random(dy-1-17))+1+cy1;
		for(var q = 0; q < array_length_1d(nds)/2; q++) { ndx[c, q] = sx+nds[2*q]; ndy[c, q] = sy+nds[2*q+1]; }
		for(var q = 0; q < array_length_1d(sds)/2; q++) { sdx[c, q] = sx+sds[2*q]; sdy[c, q] = sy+sds[2*q+1]; }
		for(var q = 0; q < array_length_1d(eds)/2; q++) { edx[c, q] = sx+eds[2*q]; edy[c, q] = sy+eds[2*q+1]; }
		for(var q = 0; q < array_length_1d(wds)/2; q++) { wdx[c, q] = sx+wds[2*q]; wdy[c, q] = sy+wds[2*q+1]; }
		for(var q = 0; q < 17; q++) {
			for(var l = 0; l < 19; l++) {
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
		var redo = false;
		var graph;
		graph[0, 0] = 0;
		//max hallways
		for(var z = 0; z < rn; z++) {
			graph[z, 0] = -1; 
			for(var w = 0; w < rn; w++) {
				var xw1 = rx1[w], xw2 = rx2[w], xz1 = rx1[z], xz2 = rx2[z];
				var yw1 = ry1[w], yw2 = ry2[w], yz1 = ry1[z], yz2 = ry2[z];
				var bordx = (xw1 == xz2) || (xw2 == xz1);
				var bordy = (yw1 == yz2) || (yw2 == yz1);
				var samex = (xw1 == xz1) || (xw2 == xz2);
				var samey = (yw1 == yz1) || (yw2 == yz2);
				//if(((w == broom_id) && (z == sroom_id)) || ((w == sroom_id) && (z == broom_id))) cnxs[w] = -1;
				if(w == z) graph[z, z] = -1;
				else if((bordx && samey) || (bordy && samex)) {
					//1 - Borders n, 2 - s, 3 - e, 4 - w
					graph[z, w] = bordx ? ((xw1==xz2) ? 3 : 4) : ((yw1==yz2) ? 2 : 1);
				}
				else {
					graph[z, w] = -1;
				}
			}
		}
		
		//pathfinding
		var path;
		path[0] = sroom_id;
		var cur = 0;
		var broom_x = rx1[broom_id];
		var broom_y = ry1[broom_id];
		var sroom_x = rx1[sroom_id];
		var sroom_y = ry1[sroom_id];
		var curx = sroom_x; var cury = sroom_y;
		while(true) {
			var dx = broom_x-curx;
			var dy = broom_y-cury;
			
			if(dx != 0) && (dy != 0) var dir = floor(random(2));	
			else if(dy != 0) dir = 0;
			else if(dx != 0) dir = 1;
			
			dir  = dir ? ((dx > 0) ? 3 : 4) : ((dy > 0) ? 2 : 1);
			var temp = path[cur];
			var nxt = -1;
			for(var l = 0; l < rn; l++) 
				if(graph[path[cur], l] == dir) 
					nxt = l;
			if(nxt != -1) && (findIndex(nxt, path) == -1) {
				path[cur+1] = nxt;
				cur++;
				curx = rx1[nxt];
				cury = ry1[nxt];
			}
			else {
				cur = 0;
				curx = sroom_x; cury = sroom_y;
				path = 0;
				path[0] = sroom_id;
				continue;
			}
			if(path[cur] == broom_id)  && (array_length_1d(path) >= mpl+2) break;
			else if(path[cur] == broom_id) {
				var cnt = 0;
				while(array_length_1d(path) < mpl+2) {
					var temp = sroom_id; var temp = broom_id;
					var ins = floor(random(array_length_1d(path)-1));
					var indx1 = path[ins], indx2 = path[ins+1];
					var dxi = (rx1[indx1] - rx1[indx2] == 0)
					var d2 = floor(random(2))+ (!dxi ? 1 : 3);
					var r1 = findIndex_2d(graph, indx1, d2);
					var d3 = dxi ? (((ry1[indx1] - ry1[indx2]) > 0) ? 1 : 2) : (((rx1[indx1] - rx1[indx2]) > 0) ? 4 : 3);
					var r2;
					if(r1 != -1) r2 = findIndex_2d(graph, r1, d3);
					if(r1 != -1) && (r2 != -1) && (findIndex(path, r1) == -1) && (findIndex(path, r2) == -1) {
						var len = array_length_1d(path);
						for(var ch = len-1; ch > ins; ch--) path[ch+2] = path[ch];
						path[ins+2] = r2;
						path[ins+1] = r1;
					}
					else cnt++;
					if(cnt > 9999) { redo = true; break; }
					///Note that there's currently 1 case where this code will NEVER work:
					   //Basically there's only 1 room decided between the broom and the sroom,
					   //and that room also happens to be a corner room, meaning that the only places
					   //that border and have free space to expand outward by 2 are blocked by the bounds
					   //of the level or the sroom and broom, making it not work
				}
				break;
			}			
		}

		if(redo) continue;
		
		var branch;
		branch[0, 0] = -1;
		var initset = false;
		var pcnt = array_length_1d(path);
		var cnct_room
		cnct_room[0] = -1; //room where the path of branch[c] branches off 
		var cnp = 1;
		while(pcnt < rn) {
			var cur = floor(random(rn));
			if(findIndex(path, cur) != -1) continue;
			var exist = false;
			var rrw = 0;
			for(var h = 0; h < cnp; h++) if(findIndex_2d(branch, h, cur) != -1) { exist = true; rrw = h; }
			if(exist) continue;
			var dir = floor(random(4));
			for(var q = 0; q < 4; q++) {
				var r = findIndex_2d(graph, cur, ((dir+q)%4)+1);
				if(r == -1) continue;
				var st = false; var rw = 0;
				for(var h = 0; h < cnp; h++) if(h != rrw && findIndex_2d(branch, h, r) != -1) { st = true; rw = h; }
				if(findIndex(path, r) != -1) ||  st {
					if(st) && (findIndex_2d(branch, rw, r) == array_length_2d(branch, rw)-1) branch[rw, array_length_2d(branch, rw)] = cur;
					else if(!initset) { branch[0, 0] = cur; initset = true; cnct_room[0] = r; }
					else { 
						branch[cnp, 0] = cur; 
						cnct_room[cnp] = r;
						cnp++;
					}
					pcnt++;
					q = 4;
				}
			}
		}
		
		var loop;
		loop[0] = -1;
		for(var m = 0; m < cnp; m++) {
			var cur = branch[m, array_length_2d(branch, m)-1];
			var dir = floor(random(4));
			for(var q = 0; q < 4; q++) {
				var r = findIndex_2d(graph, cur, ((dir+q)%4)+1);
				if(r != -1) {
					var pindex = findIndex(path, r);
					if(pindex == -1) || (array_length_2d(branch, m) + pindex-1 > mpl) {
						loop[m] = r;
						q = 4;
					}
					else loop[m] = -1;
				}
			}
		}
		
		//Generate Main Path
		for(var m = 0; m < array_length_1d(path)-1; m++) {
			w = path[m]; z = path[m+1];
			gen_path(w, z, graph);
		}
		//Generate Sub-Paths
		for(var m = 0; m < array_length_1d(branch); m++) for(var n = 0; n < array_length_2d(branch, m)-1; n++) {
			w = branch[m, n]; z = branch[m, n+1];
			gen_path(w, z, graph);
			if (loop[m] != -1) && (n = array_length_2d(branch, m)-2) {
				gen_path(loop[m], z, graph);
			}
		}
		
		//Connect All Paths together
		for(var m = 0; m < cnp; m++) {
			w = cnct_room[m]; z = branch[m, 0];
			gen_path(w, z, graph);
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