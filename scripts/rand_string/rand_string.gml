///rand_string(len)
///@param len

var str = "";

for(var c = 0; c < argument0; c++) {
	str += chr(floor(random(2)) ? floor(random(10) + 48) : floor(random(26) +97));
}

return str;