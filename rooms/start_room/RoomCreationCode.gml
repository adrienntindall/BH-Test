randomize();

window_set_fullscreen(true);

lay_id = layer_get_id("Tiles");
map_id = layer_tilemap_get_id(lay_id);
blay_id = layer_get_id("Borders");
bmap_id = layer_tilemap_get_id(blay_id);
border_tile = tilemap_get(bmap_id, 1, 1);

//Setting tiles
floor_tile = tilemap_get(map_id, 1, 1);
corn_ne = tilemap_get(map_id,0, 2);
corn_nw = tilemap_get(map_id,2, 2);
corn_se = tilemap_get(map_id,0, 0);
corn_sw = tilemap_get(map_id,2, 0);
wall_n = tilemap_get(map_id,1, 2);
wall_s = tilemap_get(map_id,1, 0);
wall_e = tilemap_get(map_id,0, 1);
wall_w = tilemap_get(map_id,2, 1);
wall_corn_ne = tilemap_get(map_id,4, 1);
wall_corn_nw = tilemap_get(map_id,3, 1);
wall_corn_se = tilemap_get(map_id,4, 2);
wall_corn_sw = tilemap_get(map_id,3, 2);
wall_corn_nse = tilemap_get(map_id,5, 2);
wall_corn_nsw = tilemap_get(map_id,5, 1);
wall_corn_ewn = tilemap_get(map_id,4, 0);
wall_corn_ews = tilemap_get(map_id,3, 0);
wall_nsew = tilemap_get(map_id,0, 3);
layers[0] = map_id;
layers[1] = layer_tilemap_get_id(layer_get_id("Tiles_2"));
layers[2] = layer_tilemap_get_id(layer_get_id("Tiles_3"));
layers[3] = layer_tilemap_get_id(layer_get_id("Tiles_4"));
for(var a = 0; a < 6; a++) for(var b = 0; b < 4; b++) tilemap_set(map_id, 0, a, b);

//Border setting
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