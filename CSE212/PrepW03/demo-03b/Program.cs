namespace demo_03b;

public static class Program {
    /// <summary>
    /// CSE 212 Lesson 3B
    /// Code that uses a Stack to do a useful task.  Need to determine the purpose
    /// of the 4 commands "a", "b", "c", and "d".
    /// </summary>
    public static void Main() {
        Console.WriteLine("Welcome to the Mystery Program");
        var run = true;
        var data = new List<string>();
        var stack = new Stack<int>();

        while (run) {
            Console.WriteLine("Enter Command: ");
            var entry = Console.ReadLine()!.Split(" ");

            if (entry.Length == 3 && entry[0] == "a") {
                var pos = int.Parse(entry[1]);
                var value = entry[2];
                DoCommand1(stack, pos, value, data);
            }
            else if (entry.Length == 1 && entry[0] == "b") {
                DoCommand2(data, stack);
            }
            else if (entry.Length == 1 && entry[0] == "c") {
                DoCommand3(data);
            }
            else if (entry.Length == 1 && entry[0] == "d") {
                run = false;
            }
            else {
                Console.WriteLine("Invalid Command");
            }
        }

        Console.WriteLine("Goodbye");
    }

    private static void DoCommand1(Stack<int> stack, int pos, string value, List<string> data) {
        if (stack.Count == 0 && pos != 0) {
            Console.WriteLine("Invalid List Position - Only 0 valid");
        }
        else if (pos < 0 || pos > stack.Count) {
            Console.WriteLine($"Invalid List Position - Must be within {0} and {stack.Count}");
        }
        else {
            data.Insert(pos, value);
            stack.Push(pos);
        }
    }

    private static void DoCommand2(List<string> data, Stack<int> stack) {
        if (stack.Count == 0) {
            Console.WriteLine($"Unable to Complete - List is empty");
        }
        else {
            var pos = stack.Pop();
            data.RemoveAt(pos);
        }
    }

    private static void DoCommand3(List<string> data) {
        Console.WriteLine($"{{\"{string.Join("\", \"", data)}\"}}");
    }
}