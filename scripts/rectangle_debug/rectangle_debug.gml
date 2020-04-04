///rectangle_debug()

draw_self();

var th = pi-point_direction(obj_player.x, obj_player.y, center_x(id), center_y(id))*pi/180;
var partial = get_partial(id, th);

draw_set_colour(c_red);

draw_line_width(center_x(id), center_y(id), center_x(id) + partial*cos(th), center_y(id) + partial*sin(th), 3);
draw_text(center_x(id), center_y(id), string(partial));
draw_text(center_x(id) + 50, center_y(id) - 50, string(center_x(id)) + " " + string(center_y(id))); 

draw_set_colour(c_orange);

var th = pi-theta;

var t0 = (obj_player.x - center_x(id) + tan(th)*(obj_player.y-center_y(id)))/(cos(th) + tan(th)*sin(th));
if(abs(t0) > hrad*image_xscale) {
	t0 = sign(t0)*hrad*image_xscale;
}
var xx = t0*cos(th) + center_x(id);
var yy = t0*sin(th) + center_y(id);

draw_circle(xx, yy, 5, false);

draw_set_colour(c_white);