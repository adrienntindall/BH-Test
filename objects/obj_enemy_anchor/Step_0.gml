/// @description Insert description here
// You can write your code in this editor

if(mouse_check_button_pressed(mb_right) && !keyboard_check(vk_shift) && !position_meeting(mouse_x, mouse_y, obj_bullet_spawner)) {
	instance_create_depth(mouse_x, mouse_y, 0, obj_bullet_spawner);
}