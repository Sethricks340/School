namespace ds2problem;

public class Stack {
    public LinkedList? _linkedList { get; set; }

    public Stack(LinkedList? linkedlist = null) {
        if (linkedlist != null) _linkedList = linkedlist;
    }

    public int? Pop(){
        //This method either returns an int, or is null
        //it will be null if there isn't anything in the list yet
        int? last = null;
        if (_linkedList != null && _linkedList._tail != null) {
            last = _linkedList._tail.Data;
            _linkedList.RemoveLast();
        }
        if (last == null) Console.WriteLine("Nothing in stack");
        return last;
    }

    public void Push(int item){
        //Add a value to the stack
        if (_linkedList != null) _linkedList.AddLast(item);
    }

    public int? Peek(){
        //This method either returns an int, or is null
        //it will be null if there isn't anything in the list yet
        if (_linkedList != null && _linkedList._tail != null) return _linkedList._tail.Data;
        else {
            Console.WriteLine("Nothing in stack");
            return null;
        }
    }
    public override string ToString(){
        if (_linkedList != null) return _linkedList.ToString().Replace("<LinkedList>", "<Stack>");
        else return "_linkedList is null";
    }
}