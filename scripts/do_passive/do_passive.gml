///do_passive() 
for(var c = 0; c < array_length_1d(global.pass_eq); c++) {
	switch(global.pass_eq[c]) {
		case passive.heat_smoke:
			with(obj_enemy) 
				if(on_fire && charged)
					charge_mult = 1.1;	
			break;
		case -1:
			break;
		default:
			show_debug_message("Note: passive in slot " + string(c) + " is not defined");
			break;
	}
}