namespace prove_09;

public class Node {
    public int Data { get; set; }
    public Node? Right { get; private set; }
    public Node? Left { get; private set; }

    public Node(int data) {
        this.Data = data;
    }

    public void Insert(int value) {
        if (value == Data) return;
        else if (value < Data)
        {
            // Insert to the left
            if (Left is null) Left = new Node(value);
            // else keep iterating
            else Left.Insert(value);
        }
        else {
            // Insert to the right
            if (Right is null) Right = new Node(value);
            //else keep iterating
            else Right.Insert(value);
        }
    }

    public bool Contains(int value) {
        if (Data == value) return true;
        else if (value < Data)
        {
            //There is not a value less than the current
            if (Left is null) return false;
            //A value exists, lets go compare it
            //remember to return the value, or it won't be saved up the chain
            else return Left.Contains(value);
        }
        else {
            //There is not a value greater than the current
            if (Right is null) return false;
            ////A value exists, lets go compare it
            //remember to return the value, or it won't be saved up the chain
            else return Right.Contains(value);
        }
    }

    public int GetHeight(int count = 1, List<int>? CountList = null)
    {
        if (CountList == null){
            CountList = new List<int>();
            CountList.Add(1);
        }
        
        if (Right != null)
        {
            count += 1;
            // Console.WriteLine($"Going right, count = {count}");
            // Console.WriteLine($"Right data: {Right.Data}");
            Right.GetHeight(count, CountList);
            count -= 1;
        }
        if (Left != null)
        {
            count += 1;
            // Console.WriteLine($"Going left, count = {count}");
            // Console.WriteLine($"Left data: {Left.Data}");
            Left.GetHeight(count, CountList);
            count -= 1;
        }

        if (Right == null && Left == null)
        {
            // Console.WriteLine($"putting into list: {count}");
            CountList.Add(count);
        }
        return CountList.Max();
    }
}