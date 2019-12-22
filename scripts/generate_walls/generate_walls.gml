///generate_walls(map_id, tileset)
//Generating walls to make things nice™

map_id = argument0;
ts = argument1;

floor_tile = 7;
corn_ne = 12;
corn_nw = 14;
corn_se = 5;
corn_sw = 2;
wall_n = 13;
wall_s = 1;
wall_e = 6;
wall_w = 8;
wall_corn_ne = 10;
wall_corn_nw = 9;
wall_corn_se = 16;
wall_corn_sw = 15;
wall_corn_nse = 17;
wall_corn_nsw = 11;
wall_corn_ewn = 4;
wall_corn_ews = 3;
wall_nsew = 18;
layers[0] = map_id;
layers[1] = layer_tilemap_create(layer_create(0, "Tiles_2"), 0, 0, ts, 64, 64);
layers[2] = layer_tilemap_create(layer_create(0, "Tiles_3"), 0, 0, ts, 64, 64);;
layers[3] = layer_tilemap_create(layer_create(0, "Tiles_4"), 0, 0, ts, 64, 64);;

//Borders
//bmap_id = layer_tilemap_create(layer_create(0, "Borders"), 0, 0, ts_border, 64, 64);
bmap_id = layer_tilemap_get_id("Borders");
layer_set_visible("Borders", false);
for(var a = 0; a < floor(room_width/64); a++) {
	for(var b = 0; b < floor(room_height/64); b++) {
		if(tilemap_get(map_id, a, b) != floor_tile) {
			tilemap_set(bmap_id, 1, a, b);	
		}
	}
}

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