using demo_07a;

// CSE 212 Lesson 7A
// Implementation of a basic Linked List data structure.

var numbers = new LinkedList();
Console.WriteLine($"Empty Linked List: {numbers}\n");

// Insert 6 numbers including a duplicated value
numbers.AddFirst(1);
numbers.AddFirst(2);
numbers.AddFirst(2);
numbers.AddFirst(3);
numbers.AddFirst(4);
numbers.AddFirst(5);
Console.WriteLine($"Inserting 6 numbers: {numbers}\n");

// Remove the head
numbers.RemoveFirst();
Console.WriteLine($"Removing the head: {numbers}\n");

// Insert after the value 3 and the value 5
numbers.AddAfter(3, 5);
numbers.AddAfter(1, 6);
Console.WriteLine($"Inserting numbers after after the value 3 and the value 1: {numbers}\n");

// Use the iterator to display each value
Console.WriteLine($"Using iterator to display all numbers:");
foreach (var x in numbers)
{
    Console.WriteLine(x);
}
Console.WriteLine();

// Use the iterator to calculate the sum of all the numbers
Console.WriteLine($"Sum of all numbers: {numbers.Sum()}\n");
