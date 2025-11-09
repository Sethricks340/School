using demo_01a;

// Input & Output
Console.WriteLine("Hello World!");
Console.Write("What is your name? ");
// Console.ReadLine();

// Variables & Expressions
string name = Console.ReadLine();
Console.WriteLine($"Your name is {name}.");
Console.WriteLine("Your name is {1}! {0} is a nice person.", name, name);
int number = 0;
var otherNumber = 1;
string myString = "myString";
var singleCharacter = 'c';
var floatingPointNumber = 1.2;
Console.WriteLine($"All of these things can go into a string: {number}, {otherNumber}, {myString}, {singleCharacter}, {floatingPointNumber}");

// Conditionals
if (name == "Brother Kay")
{
    Console.WriteLine("That's my teacher!");
}
else
{
    Console.WriteLine($"Hello, {name}.");
}

// Loops
var keepGoing = true;
var numberOfTimes = 0;
while (keepGoing)
{
    numberOfTimes += 1;
    if (numberOfTimes >= 3)
        keepGoing = false;
    Console.WriteLine($"Number of times in while loop: {numberOfTimes}");
}

for (var i = 0; i < 3; i++)
{
    Console.WriteLine($"Number of times in for loop: {i + 1}");
}

// Arrays
int[] myIntArray = new int[12];
for (int i = 0; i < myIntArray.Length; i++)
{
    // Console.WriteLine(myIntArray[i]);
    myIntArray[i] = i + 1;
    
}
Console.WriteLine($"My int array = {{{string.Join(", ", myIntArray)}}}");

// Functions
// [visibility] [return type] [name]([parameter list]) { }
Console.WriteLine(MyFunctions.GetValue());
var myArray = new[] { 1, 2, 3 };
Console.WriteLine(string.Join(", ", myArray));
MyFunctions.Change2ndElement(myArray);
Console.WriteLine(string.Join(", ", myArray));

// Classes
var song = new Song("Never Gonna Give You Up", 214);
Console.WriteLine(song);
song.Play();