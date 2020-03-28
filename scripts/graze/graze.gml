///graze(set_time)
///@param set_time

if(obj_camera.hit) {
	if(argument0) grtime = 999;
	else return 999;
}

var dist = 0;
if(cshape == shape.circle) {
	var hr = crad;
	var vr = crad;
	var cx = min(abs(obj_player.x-obj_player.crad-(center_x(id)+hr)),abs(obj_player.x+obj_player.crad-(center_x(id)-hr)))-1;
	var cy = min(abs(obj_player.y-obj_player.crad-(center_y(id)+vr)),abs(obj_player.y+obj_player.crad-(center_y(id)-vr)))-1; 
	dist = cx*cx + cy*cy;
}
else if(cshape == shape.rectangle) { 
	var th = pi-theta;
	var t0 = (obj_player.x - center_x(id) + tan(th)*(obj_player.y-center_y(id)))/(cos(th) + tan(th)*sin(th));
	if(abs(t0) > hrad*image_xscale) {
		t0 = sign(t0)*hrad*image_xscale;
	}
	var xx = t0*cos(th) + center_x(id);
	var yy = t0*sin(th) + center_y(id);
	var cx = abs(obj_player.x-xx)-2;
	var cy = abs(obj_player.y-yy)-2;
	dist = cx*cx + cy*cy-vrad*vrad-obj_player.crad*obj_player.crad;
}
if(instance_exists(parent) && parent.charged) {
	dist /= 1.2;
	dist /= parent.charge_mult;
	charge_mult = 1;
}

if(argument0) grtime = dist/obj_player.grps;
else return dist/obj_player.grps;