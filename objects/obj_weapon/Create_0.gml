/// @description Insert description here
// You can write your code in this editor
c_rad = 0; //collection radius
c_types = array(0); //graze collection types
c_amnts = array(0); //current collection ammounts
c_max = array(0); //maximum collection ammounts

rotate = false; //determines if it rotates around the player or not
r_rad = 0; //rotation radius
w_spd = 0; //angular velocity
x0 = obj_player.x;
y0 = obj_player.y;

follow = false;
a = 0;
defspd = 0;
spd = 0;
theta = 0;
f_rad = 0;

t = 0;
dt = 0;

tilemap = layer_tilemap_get_id("Borders");

release_btn = ord("C");

ui_sprite = noone;