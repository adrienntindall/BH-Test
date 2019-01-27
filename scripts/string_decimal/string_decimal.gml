///string_decimal(str)
///@param str
return string_length(string_digits(string_replace(argument0, ".", ""))) == (string_length(argument0) - string_count(".", argument0));
