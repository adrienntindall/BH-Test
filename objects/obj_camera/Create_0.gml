/// @description Insert description here
// You can write your code in this editor

dt = 0;
t = 0;

width = 1280;
height = 720;

def_width = width*1.25;
def_height = height*1.25;

hit = false;
cycle_time = .2;
x0 = 0;
y0 = 0;
sspd_max = 15;

playerCamera = camera_create_view(x, y, def_width, def_height, 0, self, -1, -1, def_width/2, def_height/2);
//playerCamera = camera_create_view(x, y, def_width, def_height, 0, -1, -1, -1, width/2, height/2);
view_camera[0] = playerCamera;

patternCamera = camera_create_view(x, y, width*1.5, height*1.5, self, -1, -1, width*1.5, height*1.5);