namespace StackStudentProblem;

public static class Plates {
        private static Stack<string> _plates = new Stack<string>();
    public static void Run() {
        _plates.Push("Blue");
        _plates.Push("Green");
        _plates.Push("Green");
        _plates.Push("Red");
        _plates.Push("Green");
        _plates.Push("Green");
        _plates.Push("Red");
        _plates.Push("Green");
        _plates.Push("Blue");
        _plates.Push("Green");
        _plates.Push("Red");

        CountColor("Red", new Stack<string>(_plates)); //Copy of _plates is passed
        CountColor("Blue", new Stack<string>(_plates)); //Copy of _plates is passed
        CountColor("Green", new Stack<string>(_plates)); //Copy of _plates is passed

        PrintOrder(new Stack<string>(_plates)); //Copy of _plates is passed
    }

    //This function takes in a color to count, and the stack to iterate through. 
    //Note: Copies of the stack have been passed through to this function already, 
    //so popping from the stack inside the function will not affect the original.
    //At the end of the function, print how many of the color plates were found.
    private static void CountColor(string color, Stack<string> Plates){
        int count = 0;
        while (Plates.Count > 0){
            string TopPlate = Plates.Pop();
            if (TopPlate == color) count += 1;
        }
        Console.WriteLine($"{count} {color} plates");
    }
    
    //This function takes in a stack to iterate through. The original is passed to it this time, 
    //So popping will remove the original. This is acceptable in this case because we are done 
    //using the stack.
    private static void PrintOrder(Stack<string> Plates){
        while (Plates.Count > 0) Console.WriteLine(Plates.Pop());
    }
}