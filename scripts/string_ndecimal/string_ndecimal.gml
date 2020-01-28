///string_ndecimal(str)
///@param str

var str = argument0;
if(string_pos(str, ".") != 0) str = string_digits(string_copy(str, 0, string_pos(str, ".")-1)) + "." + string_digits(string_copy(str, string_pos(str, "."), string_length(str)-string_pos(str, ".")));
else str = string_digits(str);
if(string_pos(str, 0) == "-" && string_length(str) >= 1) str = "-" + str;
return str;