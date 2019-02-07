///array_remove_index(arr, index)
///@param arr
///@param index
var arr = argument0;
var index = argument1;
var new_arr = 0;
for(var c = index; c < array_length_1d(arr); c++){
  if(c < index) new_arr[c] = arr[c];
  else if (c > index) new_arr[c-1] = arr[c];
}
return new_arr;