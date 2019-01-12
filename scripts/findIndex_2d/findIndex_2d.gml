///findIndex_2d(array, x, c)
///@param array the array to search
///@param x the sub array to look in
///@param c the value to look for

var tempArray, X, c;
tempArray = argument[0];
X = argument[1];
c = argument[2];
for(var l = 0; l < array_length_2d(tempArray, X); l++) 
	if(tempArray[X, l] == c) 
		return l;
return -1;

