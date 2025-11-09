//Created by Seth Ricks
//Fall 2024
//CSE 212 
//Brother Comeau 

//This code demonstrates the following operations of a stack: 
// Push(item)
// Peek()
// Pop()
// Clear()

var FootballPlayers = new Stack<string>();
FootballPlayers.Push("Seth Ricks");
FootballPlayers.Push("Brother Comeau");
FootballPlayers.Push("Cooper Rush");
FootballPlayers.Push("Patrick Mahomes");
FootballPlayers.Push("Tom Brady");

//Prints the value on the top of the stack (Tom Brady)
Console.WriteLine($"Top of the stack: {FootballPlayers.Peek()}"); 

FootballPlayers.Pop(); //removes Tom Brady from the top of the stack

FootballPlayers.Push("Jerry Rice"); //Adds Jerry Rice to the top of the stack

// Removes the player on the top of the stack, and then prints in the following order:
// Jerry Rice
// Patrick Mahomes
// Cooper Rush
// Brother Comeau
// Seth Ricks
while (FootballPlayers.Count > 0) Console.WriteLine(FootballPlayers.Pop());

//Clears the stack
FootballPlayers.Clear();

//Confirms the stack is empty: message is printed to the screen
if (FootballPlayers.Count == 0) Console.WriteLine("Stack is empty! ");