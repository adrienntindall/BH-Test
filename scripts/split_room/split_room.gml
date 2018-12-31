///split_room(x_bound1, y_bound1, x_bound2, y_bound2, n)

var x1 = argument0; //x of top left corner
var y1 = argument1; //y of top left corner
var x2 = argument2; //x of bottom right corner
var y2 = argument3; //y of bottom right corner
var n = argument4; //number of times left to split

var dx = x2-x1;
var dy = y2-y1;

if(n == 0) {
	var max_size = .3*dx*dy;
	var min_size = .15*dx*dy;
	var size = max_size+1;
	var x3, x4, y3, y4;
	while(size > max_size || size < min_size) {
		x3 = random(dx-2)+x1+1;
		x4 = random(x2-x3-2)+x3+1;
		var ddx = x4-x3;
		y3 = random(dy-2)+y1+1;
		y4 = random(y2-y3-2)+y3+1;
		var ddy = y4-y3;
		size = (ddx > 4 && ddy > 4) ? ddx*ddy : max_size+1;
	}
	for(var xx = x3; xx < x4+1; xx++) {
		for(var yy = y3; yy < y4+1; yy++) {
			tilemap_set(map_id, floor_tile, xx, yy);
		}
	}
	if(size >= broom_min_size && !broom_set) {
		broom_set = true;
		broom_x1 = x3*64;
		broom_x2 = x4*64;
		broom_y1 = y3*64;
		broom_y2 = y4*64;
		var b = instance_create_depth((broom_x1+broom_x2)/2, (broom_y1+broom_y2)/2, 1, boss);
		b.image_xscale = 5;
		b.image_yscale = 5;
	}
	else {
		var m = round(.02*size);
		for(var r = 0; r < m; r++) {
			while(true) {
				var ex = random(dx) + x1;
				var ey = random(dy) + y1;
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
}
else if(dx < 17 || dy < 17) split_room(x1, y1, x2, y2, 0);
else {
	var dir, xy, dxy1, dxy2;
	while(true) {
		dir = round(random(1));
		xy = dir ? random(dx) + x1 : random(dy) + y1;
		dxy1 = dir ? xy-x1 : xy-y1;
		dxy2 = dir ? x2-xy : y2-xy;
		if(dxy1 < 8 || dxy2 < 8) continue;
		else {
			split_room(x1, y1, (dir ? xy : x2), (dir ? y2 : xy), n-1);
			split_room((dir ? xy : x1), (dir ? y1 : xy), x2, y2, n-1);
			var xtop, xbot, ytop, ybot;
			while(true) {
				xtop = floor(random(dir ? dxy1 : dx) + x1);
				xbot = floor(random(dir ? dxy2 : dx) + (dir ? x1 + dxy1 : x1));
				ytop = floor(random(dir ? dy : dxy1) + y1);
				ybot = floor(random(dir ? dy : dxy2) + (dir ? y1 : y1 + dxy1));
				
				if((tilemap_get(map_id, xtop, ytop) != floor_tile)
				   || (tilemap_get(map_id, xbot, ybot) != floor_tile)) continue;
				
				var cruxx, cruxy;
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
			break;
		}
	}
}