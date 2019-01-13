/// @description Insert description here
// You can write your code in this editor
if(mode == 1) {
	with(other) {
		hp-=other.dmg;
	}

	mode = 2;
}
else if(mode == 0) && (icd <= 0) {
	with(other) {
		hp -= other.dmg/4;	
	}
	icd = .5;
}