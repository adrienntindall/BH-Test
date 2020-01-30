/// @description Insert description here
// You can write your code in this editor
if(!frozen) {
	instance_activate_object(obJ_time_keeper);
}
else {
	instance_deactivate_object(obJ_time_keeper);
	global.dt = 0;
}

frozen = !frozen;