// Fixed Arrays
var myArray = new[] { 1, 2, 3, 4, 5 };
Console.WriteLine("array: " + string.Join(", ", myArray));

// Dynamic Arrays (Lists)
var myList = new List<int> { 1, 2, 3, 4, 5 };
Console.WriteLine("list: " + string.Join(", ", myList));

// You can replace in both
myArray[0] = 100;
myList[0] = 100;
Console.WriteLine("array: " + string.Join(", ", myArray));
Console.WriteLine("list: " + string.Join(", ", myList));

// You can only add / remove from a list
myList.Add(6);
myList.RemoveAt(0);
Console.WriteLine("list: " + string.Join(", ", myList));

// You can only slice an array
Console.WriteLine("array: " + string.Join(", ", myArray[2..])); // from index 2 on
Console.WriteLine("array: " + string.Join(", ", myArray[..2])); // up to but not including index 2

// Copy arrays with slicing
Console.WriteLine("array: " + string.Join(", ", myArray));
Console.WriteLine("array copy: " + string.Join(", ", myArray[..])); //copying the array and making a new one, in a different spot in memory
Console.WriteLine("array hash: " + myArray.GetHashCode()); //where it is in memory
Console.WriteLine("array copy hash: " + myArray[..].GetHashCode()); //where it is in memory
