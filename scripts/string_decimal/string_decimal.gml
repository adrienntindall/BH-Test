///string_decimal(str)
///@param str
var __characters = "0123456789."; // Allowed characters

var __newstr = "";
for (var i = 1; i <= string_length(argument0); ++i) // Loop through each character in the string
{
    var __char = string_copy(argument0, i-1, 1); // Copy the next character
    if (string_pos(__characters, __char) > 0) // Check if our character is in our permitted list
        __newstr += __char; // If so, add it to our final string
}

return __newstr;