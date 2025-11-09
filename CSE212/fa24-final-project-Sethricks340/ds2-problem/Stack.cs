namespace ds2solution;

public class Stack {
    public LinkedList? _linkedList { get; set; }

    public Stack(LinkedList? linkedlist = null) {
        if (linkedlist != null) _linkedList = linkedlist;
    }

    public int? Pop(){
        //TODO
        //This method either returns an int, or is null
        //it will be null if there isn't anything in the list yet
        //remember that a stack uses LIFO (last in first out)
        return null; //remove to solve
    }

    public void Push(int item){
        //TODO
        //Add a value to the stack
        //remember that a stack uses LIFO (last in first out)
    }

    public int? Peek(){
        //TODO
        //This method either returns an int, or is null
        //it will be null if there isn't anything in the list yet
        //remember that a stack uses LIFO (last in first out)
        return null; //remove to solve
    }
    public override string ToString(){
        if (_linkedList != null) return _linkedList.ToString().Replace("<LinkedList>", "<Stack>");
        else return "_linkedList is null";
    }
}