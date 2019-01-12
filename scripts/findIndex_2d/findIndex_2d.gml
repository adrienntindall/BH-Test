///findIndex_2d(x, y, array)
///@param i the value to find
///@param array the array to search

var i, tempArray;
tempArray = argument[0];
for(i=0; i<array_length_1d(tempArray); i++){
    if(tempArray[i]==argument[1])
        return i;
}
return -1;

for(var l = 0; l < array_length_2d(graph, r1); l++) 
						if(graph[r1, l] == d3) 
							r2 = l;