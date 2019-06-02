/// @description Insert description here
// You can write your code in this editor

while(true) {
	contents = floor(random(passive.length+active.length));
	if((contents < passive.length && findIndex(global.pass_own, contents) == -1) || (contents >= passive.length && findIndex(global.active_own, contents-passive.length) == -1)) {
		break;	
	}
}