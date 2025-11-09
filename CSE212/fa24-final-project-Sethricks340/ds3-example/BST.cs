using System.Collections;

namespace ds3Example;

public class BinarySearchTree : IEnumerable<int> {
    private Node? _root;

    public void Insert(int value) {
        // Create new node
        Node newNode = new Node(value);
        // If the list is empty, then point root to the new node.
        if (_root is null) _root = newNode;
        // If the list is not empty, then only root will be affected.
        else InsertNode(_root, value);
    }

    public void InsertNode(Node node, int value) {
        if (value == node.Data) return;
        else if (value < node.Data)
        {
            // Insert to the left
            if (node.Left is null) node.Left = new Node(value);
            // else keep iterating
            else InsertNode(node.Left, value);
        }
        else {
            // Insert to the right
            if (node.Right is null) node.Right = new Node(value);
            //else keep iterating
            else InsertNode(node.Right, value);
        }
    }

    public bool Contains(int value) {
        return _root != null && ContainsNode(_root, value);
    }

    public bool ContainsNode(Node node, int value) {
        if (node.Data == value) return true;
        else if (value < node.Data)
        {
            //There is not a value less than the current
            if (node.Left is null) return false;
            //A value exists, lets go compare it
            //remember to return the value, or it won't be saved up the chain
            else return ContainsNode(node.Left, value);
        }
        else {
            //There is not a value greater than the current
            if (node.Right is null) return false;
            //A value exists, lets go compare it
            //remember to return the value, or it won't be saved up the chain
            else return ContainsNode(node.Right, value);
        }
    }
    IEnumerator IEnumerable.GetEnumerator() {
        // call the generic version of the method
        return GetEnumerator();
    }

    public IEnumerator<int> GetEnumerator() {
        var numbers = new List<int>();
        TraverseForward(_root, numbers);
        foreach (var number in numbers) {
            yield return number;
        }
    }

    private void TraverseForward(Node? node, List<int> values) {
        if (node is not null) {
            TraverseForward(node.Left, values);
            values.Add(node.Data);
            TraverseForward(node.Right, values);
        }
    }
    public override string ToString() {
        return "<Bst>{" + string.Join(", ", this) + "}";
    }
}