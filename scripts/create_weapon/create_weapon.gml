///create_weapon(case, disp, bt, sp)
///@param case
///@param disp
///@param bt
///@param sp

var dmg = 1; //Damage multiplier
var codo = 0; //Cooldown value
var b = 0; //the bullet we'll be dealing with

enum wp_sp {
	front,
	front_back,
	left_right,
	circular_4,
	circular_6,
	circular_8,
	orbital_5,
	scatter,
	length
}

//Casing - Affects spawn pattern
var theta = point_direction(x, y, mouse_x, mouse_y);
switch(argument0) {
	case wp_sp.front:
		b[0] =  instance_create_depth(x, y, 0, obj_bullet);
		b[0].image_angle = theta;
		b[0].theta = pi * (theta/180);
		codo = .14;
		break;
	case wp_sp.front_back:
		b = spawn_circular(2, obj_bullet, noone, pi*(theta/180), 0, 0, true);
		codo = .2;
		dmg *= .8;
		break;
	case wp_sp.left_right:
		b = spawn_circular(2, obj_bullet, noone, pi*(theta/180) + pi/2, 0, 0, true);
		codo = .2;
		dmg *= .8;
		break;
	case wp_sp.circular_4:
		b = spawn_circular(4, obj_bullet, noone, pi*(theta/180) + pi/4, 0, 0, true);
		codo = .22;
		dmg *= .75;
		break;
	case wp_sp.circular_6:
		b = spawn_circular(6, obj_bullet, noone, pi*(theta/180) + pi/2, 0, 0, true);
		codo = .24;
		dmg *= .7;
		break;
	case wp_sp.circular_8:
		b = spawn_circular(8, obj_bullet, noone, pi*(theta/180) + pi/2, 0, 0, true);
		codo = .27;
		dmg *= .65;
		break;
	case wp_sp.orbital_5:
		break;
	case wp_sp.scatter:
		var c = 0;
		repeat(ceil(random(3))) {
			var spread = random(pi/4)-pi/8;
			b[c] = instance_create_depth(x, y, 1, obj_bullet);
			b[c].theta = pi*theta/180+spread;
			b[c].image_angle = b[c].theta *180/pi;
			b[c].spd = 500;
			b[c].life = 1.2;
			b[c].nlife = true;
			b[c].a = -1*(random(350)+500);
			b[c].ta = -.22;
			dmg = .2;
			c++;
		}
		codo = .15;
		break;
	default:
		show_debug_message("Note, casing " + string(argument0) + " is not implemented");
		break;
}

enum wp_mv {
	linear,
	split,
	length	
}

enum wp_bt {
	basic,
	length
}


enum wp_ex {
	flame,
	length	
}

for(var c = 0; c < array_length_1d(b); c++) {
	
	//Dispensing - Affects movement pattern
	b[c].mov_pat = argument1;

	//Bullet Type - Base bullet appearance/size/damage/other affects	
	switch(argument2) {
		case wp_bt.basic:
			b[c].sprite_index = spr_bullet;
			b[c].dmg = 1;
			b[c].bt_aff = -1;
			if(c == 0) codo *= .85;
			break;
		default:
			break;
	}
	
	//Special slot - extra affects
	switch(argument3) {
		default:
			break;
	}

	b[c].dmg *= dmg;
}

if(b != 0) cd[clay] = codo;

var temp = 0;