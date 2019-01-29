///string_ndecimal(str)
///@param str

var str = argument0;
str = string_digits(string_copy(str, 0, string_char_at(str, ".")-1)) + "." + string_digits(string_copy(str, string_char_at(str, "."), string_length(str)-string_char_at(str, ".")));
if(string_char_at(str, 0) == "-" && string_length(str) >= 1) str = "-" + str;
return str;