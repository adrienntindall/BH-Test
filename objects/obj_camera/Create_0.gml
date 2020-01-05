/// @description Insert description here
// You can write your code in this editor

ar = 2048/1536;
width = 2048/2;
height = 1536/2;

playerCamera = camera_create_view(x, y, width, height, 0, self, -1, -1, width/2, height/2);
view_camera[0] = playerCamera;