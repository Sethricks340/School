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
        if (value == node.Data && name == node.Name) return;
        else if (value <= node.Data)
        {
            // Insert to the left
            if (node.Left is null) node.Left = new Node(value, name);
            // else keep iterating
            else InsertNode(node.Left, value, name);
        }
        else {
            // Insert to the right
            if (node.Right is null) node.Right = new Node(value, name);
            //else keep iterating
            else InsertNode(node.Right, value, name);
        }
    }

    public bool ContainsAge(int age) {
        return _root != null && GetAges().Contains(age);
    }
    public bool ContainsName(string name) {
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
        var NumbersAndNames = new List<Tuple<int, string>>();
        TraverseForward(_root, NumbersAndNames);
        foreach (var pair in NumbersAndNames) Names.Add(pair.Item2);
        return Names;
    }

    public List<int> GetAges(){
        var Ages = new List<int>();
        var NumbersAndNames = new List<Tuple<int, string>>();
        TraverseForward(_root, NumbersAndNames);
        foreach (var pair in NumbersAndNames) Ages.Add(pair.Item1);
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