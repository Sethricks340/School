namespace ds2problem;

public static class LinkedListTester {
    public static void Run() {
        //implementation of a stack
        LinkedList linkedlist = new LinkedList(new List<int> {10, 20, 30, 50, 70});
        Stack stack = new Stack(linkedlist);
        Console.WriteLine(stack.Pop()); //70
        Console.WriteLine(stack.ToString()); //<LinkedList>{10, 20, 30, 50}
        Console.WriteLine(stack.Peek()); //50
        Console.WriteLine(stack.ToString()); //<LinkedList>{10, 20, 30, 50}
        stack.Push(100); 
        Console.WriteLine(stack.ToString()); //<LinkedList>{10, 20, 30, 50, 100}
        
        LinkedList linkedlist1 = new LinkedList();
        Stack stack1 = new Stack(linkedlist1);
        Console.WriteLine(stack1.Pop()); //Nothing in stack
        Console.WriteLine(stack1.Peek()); //Nothing in stack
        Console.WriteLine(stack1.ToString()); //<Stack>{}
        stack1.Push(100); 
        Console.WriteLine(stack1.ToString()); //<Stack>{100}
    }
}
