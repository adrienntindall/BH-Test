/// @description Insert description here
// You can write your code in this editor

width = 1280;
height = 720;

playerCamera = camera_create_view(x, y, width*1.25, height*1.25, 0, self, -1, -1, width/2, height/2);
view_camera[0] = playerCamera;

patternCamera = camera_create_view(x, y, width*1.5, height*1.5, self, -1, -1, width*1.5, height*1.5);