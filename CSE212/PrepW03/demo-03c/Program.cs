// CSE 212 Lesson 3C
//
// Code that uses a Stack to do a useful task.  
// Predict what the answer will be.  
// Why does it work? 

var numbers = new Stack<int>();
var number =  1;

while (number > 0 || number < 0)
{
    Console.Write("Enter a number (0 to stop): ");
    number = int.Parse(Console.ReadLine()!);
    if (number > 0 || number < 0)
        numbers.Push(number);
}

if (numbers.Count == 0) {
    Console.WriteLine("Boring... Goodbye");
    return;
}

while (numbers.Count > 1) {
    var number1 = numbers.Pop();
    var number2 = numbers.Pop();
    numbers.Push(number1 + number2);
}

Console.WriteLine(numbers.Pop());
