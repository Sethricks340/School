using System.Collections;

namespace TreeStudentProblem;

public class BinarySearchTree : IEnumerable<Tuple<int,string>> {
    private Node? _root;

    public void Insert(int value, string name) {
        // Create new node
        Node newNode = new Node(value, name);
        // If the list is empty, then point root to the new node.
        if (_root is null) _root = newNode;
        // If the list is not empty, then only root will be affected.
        else InsertNode(_root, value, name);
    }

    public void InsertNode(Node node, int value, string name) {
        //TODO PROBLEM 1
        //hint: same as before, but now when we create a node we use the name as well
        //make sure that this functions allows duplicates if it's not the same name AND age
    }

    public bool ContainsAge(int age) {
        //Using the List.Contains instead of writing a new function
        //This is because we have already written the GetAges function 
        //that returns a list of ages 
        return _root != null && GetAges().Contains(age);
    }
    public bool ContainsName(string name) {
        //Using the List.Contains instead of writing a new function
        //This is because we have already written the GetAges function 
        //that returns a list of ages 
        return _root != null && GetNames().Contains(name);
    }

    IEnumerator IEnumerable.GetEnumerator() {
        return GetEnumerator();
    }

    public IEnumerator<Tuple<int, string>> GetEnumerator() {
        var NumbersAndNames = new List<Tuple<int, string>>();
        TraverseForward(_root, NumbersAndNames);
        foreach (var pair in NumbersAndNames) {
            yield return pair;
        }
    }

    private void TraverseForward(Node? node, List<Tuple<int, string>> NumbersAndNames) {
        if (node is not null) {
            TraverseForward(node.Left, NumbersAndNames);
            NumbersAndNames.Add(new Tuple<int, string>(node.Data, node.Name));
            TraverseForward(node.Right, NumbersAndNames);
        }
    }
    
    public List<string> GetNames(){
        var Names = new List<string>();
        //TODO PROBLEM 2
        //Hint: use TraverseForward function
        return Names;
    }

    public List<int> GetAges(){
        var Ages = new List<int>();
        //TODO PROBLEM 2
        //Hint: use TraverseForward function
        return Ages;
    }

    public void PrintNames(){
        Console.WriteLine(string.Join(", ", GetNames()));
    }
    public void PrintAges(){
        Console.WriteLine(string.Join(", ", GetAges()));
    }

    public override string ToString() {
        return "<Bst>{" + string.Join(", ", this) + "}";
    }
}