/// @description Insert description here
// You can write your code in this editor

draw_self();

var th = pi-point_direction(obj_player.x, obj_player.y, centerx, centery)*pi/180;
var partial = get_partial(id, th);

draw_set_colour(c_red);

draw_line_width(centerx, centery, centerx + partial*cos(th), centery + partial*sin(th), 3);
draw_text(centerx, centery, string(partial));
draw_text(centerx + 50, centery - 50, string(centerx) + " " + string(centery)); 

draw_set_colour(c_orange);

var th = pi-theta;

var t0 = (obj_player.x - center_x(id) + tan(th)*(obj_player.y-center_y(id)))/(cos(th) + tan(th)*sin(th));
var xx = t0*cos(th) + center_x(id);
var yy = t0*sin(th) + center_y(id);

draw_circle(xx, yy, 5, false);

draw_set_colour(c_white);


//Debug stuff ^
