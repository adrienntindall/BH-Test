///gen_path(r1, r2, graph)
///@param r1
///@param r2
///@param graph

var w = argument0, z = argument1, graph = argument2;
var xtop, xbot, ytop, ybot;
while(true) {
	switch(graph[w, z]) {
		case 1: //North
			var dtop = floor(random(array_length_2d(ndx, w)));
			var dbot = floor(random(array_length_2d(sdx, z)));
			xtop = ndx[w, dtop]; ytop = ndy[w, dtop];
			xbot = sdx[z, dbot]; ybot = sdy[z, dbot];
			xtop = floor(xtop); ytop = floor(ytop); xbot = floor(xbot); ybot = floor(ybot);
			var l1 = instance_create_depth(64*xtop, 64*(ytop-1), 0, obj_door);
			l1.rn = w;
			var l2 = instance_create_depth(64*xbot, 64*(ybot+1), 0, obj_door);
			l2.rn = z;
			break;
		case 2: //South
			var dtop = floor(random(array_length_2d(sdx, w)));
			var dbot = floor(random(array_length_2d(ndx, z)));
			xtop = sdx[w, dtop]; ytop = sdy[w, dtop];
			xbot = ndx[z, dbot]; ybot = ndy[z, dbot];
			xtop = floor(xtop); ytop = floor(ytop); xbot = floor(xbot); ybot = floor(ybot);
			var l1 = instance_create_depth(64*xtop, 64*(ytop+1), 0, obj_door);
			l1.rn = w;
			var l2 = instance_create_depth(64*xbot, 64*(ybot-1), 0, obj_door);
			l2.rn = z;
			break;
		case 3: //East
			var dtop = floor(random(array_length_2d(edx, w)));
			var dbot = floor(random(array_length_2d(wdx, z)));
			xtop = edx[w, dtop]; ytop = edy[w, dtop];
			xbot = wdx[z, dbot]; ybot = wdy[z, dbot];
			xtop = floor(xtop); ytop = floor(ytop); xbot = floor(xbot); ybot = floor(ybot);
			var l1 = instance_create_depth(64*(xtop+1), 64*ytop, 0, obj_door);
			l1.rn = w;
			var l2 = instance_create_depth(64*(xbot-1), 64*ybot, 0, obj_door);
			l2.rn = z;
			break;
		case 4: //West
			var dtop = floor(random(array_length_2d(wdx, w)));
			var dbot = floor(random(array_length_2d(edx, z)));
			xtop = wdx[w, dtop]; ytop = wdy[w, dtop];
			xbot = edx[z, dbot]; ybot = edy[z, dbot];
			xtop = floor(xtop); ytop = floor(ytop); xbot = floor(xbot); ybot = floor(ybot);
			var l1 = instance_create_depth(64*(xtop-1), 64*ytop, 0, obj_door);
			l1.rn = w;
			var l2 = instance_create_depth(64*(xbot+1), 64*ybot, 0, obj_door);
			l2.rn = z;
			break;
		default:
			break;
	}
	
	var dir = graph[w, z] > 2;	
	var crux = dir ? floor(random(abs(xtop-xbot)-4) + min(xtop, xbot)+2)
				: floor(random(abs(ytop-ybot)-4) + min(ytop, ybot)+2);
				
	paint_line(dir ? xtop : ytop, crux, dir ? ytop : xtop, dir, map_id, floor_tile);
	//go from (xtop, ytop) -> (crux, ytop) or (xtop, crux)
	paint_line(dir ? ytop : xtop, dir ? ybot : xbot, crux, !dir, map_id, floor_tile);
	//go from (crux, ytop) or (xtop, crux) -> (crux, ybot) or (xbot, crux)
	paint_line(crux, dir ? xbot : ybot, dir ? ybot : xbot, dir, map_id, floor_tile);
	//go from (xbot, crux) or (crux, ybot) -> (xbot, ybot)
	
	
	var fow = instance_create_depth(64*(min(xtop, xbot)-.5+(dir ? 2 : -1)), 64*(min(ytop, ybot)-.5+(dir ? -1 : 2)), 0, obj_fow);
	fow.image_xscale = abs(xtop-xbot)+1+(dir ? -3 : 3);
	fow.image_yscale = abs(ytop-ybot)+1+(dir ? 3 : -3);
	
	break;
}