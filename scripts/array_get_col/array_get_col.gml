///array_get_col(array, col)
///@param array
///@param col
var arr = argument0;
var col = argument1;

var temp = 0;

for(var c = 0; c < array_length_2d(arr, col); c++) {
	temp[c] = arr[col, c];	
}

return temp;