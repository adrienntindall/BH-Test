/// @description Handling input

global.back_frame--;

var pbutt = keyboard_check_pressed(vk_escape);

if(pbutt) global.pause = !global.pause;

if(pbutt && global.pause) {
	if(!sprite_exists(global.screenShot)){
        global.screenShot = sprite_create_from_surface(application_surface,0,0,view_wport,view_hport,0,0,0,0);    
    }	
	//global.cur_menu = instance_id;
	instance_deactivate_all(true);
}

if(!global.pause) { 
	instance_activate_all(); 
	if(sprite_exists(global.screenShot)) sprite_delete(global.screenShot);
	if(pbutt) global.cur_menu = menus.pause;
	exit;
}

if(global.cur_menu == menus.pause) && (global.back_frame <= 0) {
	var move = keyboard_check_pressed(ord("S"))-keyboard_check_pressed(ord("W"));
	mpos = (mpos + move)%tot;
	if(mpos < 0) mpos = options.length - 1;


	var change = keyboard_check_pressed(ord("D"))-keyboard_check_pressed(ord("A"));

	var select = keyboard_check_pressed(ord("E"));

	if(select) switch(mpos) {
		case options.resume:
			global.pause = false;
			instance_activate_all(); 
			if(sprite_exists(global.screenShot)) sprite_delete(global.screenShot);
			break;
		case options.quit:
			game_end();
			break;
		case options.level_edit:
			room_goto(level_editor);
			break;
		case options.pat_edit:
			room_goto(pattern_editor);
			break;
		default:
			break;
	}
	if(change != 0) switch(mpos) {	
		case options.focus:
			
			break;
		default:
			break;
	}
}