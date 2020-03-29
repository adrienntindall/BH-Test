/// @description Handling input

global.back_frame--;

var pbutt = keyboard_check_pressed(vk_escape);

if(pbutt) global.pause = !global.pause;

if(pbutt && global.pause) {
	if(!sprite_exists(global.screenShot)){
        global.screenShot = sprite_create_from_surface(application_surface,0,0,view_xport[0],view_yport[0],0,0,0,0);    
    }	
	instance_deactivate_all(true);
}

if(!global.pause) { 
	if(pbutt) instance_activate_all(); 
	if(sprite_exists(global.screenShot)) sprite_delete(global.screenShot);
	if(pbutt) global.cur_menu = menus.pause;
	exit;
}

if(global.cur_menu == menus.pause) && (global.back_frame <= 0) {
	var move = keyboard_check_pressed(vk_down)-keyboard_check_pressed(vk_up);
	mpos = (mpos + move)%tot;
	if(mpos < 0) mpos = options.length - 1;


	var change = keyboard_check_pressed(vk_right)-keyboard_check_pressed(vk_left);

	var select = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter);

	if(select) switch(mpos) {
		case options.resume:
			global.pause = false;
			instance_activate_all(); 
			if(sprite_exists(global.screenShot)) sprite_delete(global.screenShot);
			break;
		case options.quit:
			game_end();
			break;
		/*case options.level_edit:
			//room_goto(level_editor);
			break;
		case options.pat_edit:
			room_goto(room_pattern_editor);
			global.pause = false;
			instance_activate_all(); 
			if(sprite_exists(global.screenShot)) sprite_delete(global.screenShot);
			break;*/
		default:
			break;
	}
	if(change != 0) switch(mpos) {	
		default:
			break;
	}
}