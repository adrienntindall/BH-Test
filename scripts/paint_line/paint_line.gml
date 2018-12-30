///paint_line(xy1, xy2, yx, dir, map, tile)

var xy1 = argument0;
var xy2 = argument1;
var yx = argument2;
var dir = argument3;
var map = argument4;
var tile = argument5;

for(var c = min(xy1, xy2); c <= max(xy1, xy2); c++) {
	tilemap_set(map, tile, dir ? c : yx, dir ? yx : c);
}
