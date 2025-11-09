namespace queue_stacks;

/*
 * MyQueue -> A queue that is First In, First Out
 *
 * Implement the following methods using Stack<int> data structures
 *
 * - constructor method
 * - void Add(int value)
 * - int Remove()
 * - int Size()
 *
 */

public class MyQueue
{
    Stack<int> stack = new Stack<int>();
    Stack<int> stack2 = new Stack<int>();
    public MyQueue(){}
    public void Add(int value)
    {
        stack.Push(value);
    }

    public int Remove()
    {
        if (stack.Count() == 0)
        {
            throw new ApplicationException("Error! Nothing in the stack!");
        }
        
        while(stack.Count != 0)
        {
            stack2.Push(stack.Pop());
        }

        int answer = stack2.Pop();
        
        while(stack2.Count != 0)
        {
            stack.Push(stack2.Pop());
        }

        return answer;

    }

    public int Size()
    {
        return stack.Count;
    }

}