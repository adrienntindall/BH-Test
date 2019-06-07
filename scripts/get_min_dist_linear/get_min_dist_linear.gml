///get_min_dist_linear(laser)
///@param laser
///@description meant to only be called by the player object
var laser = argument0;
if(!instance_exists(laser)) return 9999;
var mint = (x - laser.x0 + tan(laser.theta)*(y-laser.y0))/(laser.spd*cos(laser.theta)+laser.spd*tan(laser.theta)*sin(laser.theta));
if(mint > laser.tf || mint < laser.tb) {
	return sqrt(min((x-x_las_lin(laser, laser.tf))*(x-x_las_lin(laser, laser.tf)) + (y-y_las_lin(laser, laser.tf))*(y-y_las_lin(laser, laser.tf)), (x-x_las_lin(laser, laser.tb))*(x-x_las_lin(laser, laser.tb)) + (y-y_las_lin(laser, laser.tb))*(y-y_las_lin(laser, laser.tb))));
}
else return sqrt((x-x_las_lin(laser, mint))*(x-x_las_lin(laser, mint)) + (y-y_las_lin(laser, mint))*(y-y_las_lin(laser, mint)));