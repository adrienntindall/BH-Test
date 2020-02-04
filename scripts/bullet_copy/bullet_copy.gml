///bullet_copy(id, x, y)
///@param id
///@param x
///@param y

var bt = argument0;
var xx = argument1;
var yy = argument2;
var b = -1;

with(bt) {
	b = instance_copy(false);
	instance_activate_object(b);
	b.tag = false;
	b.x = xx;
	b.y = yy;
}

return b;