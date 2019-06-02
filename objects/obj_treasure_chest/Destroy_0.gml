/// @description Insert description here
// You can write your code in this editor
if(contents < passive.length) {
	if(global.pass_own[0] == -1) {
		global.pass_own[0] = contents;	
	}
	else global.pass_own[array_length_1d(global.pass_own)] = contents;
}
else {
	if(global.active_own[0] == -1) {
		global.active_own[0] = contents-passive.length;	
	}
	else global.active_own[array_length_1d(global.active_own)] = contents-passive.length;	
}