using System.Collections;

namespace ds2problem;

public class LinkedList : IEnumerable<int> {
    public Node? _head;
    public Node? _tail;
    public LinkedList(List<int>? data = null) //optionally null
    {
        //Add all of the data to the linked list, in order
        if (data != null) foreach (int item in data) AddLast(item);
    }

    //Add the value to the beginning of the list
    public void AddFirst(int value) {
        Node newNode = new Node(value);
        if (_head is null) {
            _head = newNode;
            _tail = newNode;
        }
        else {
            newNode.Next = _head; 
            _head.Prev = newNode; 
            _head = newNode; 
        }
    }

    //Add the value to the end of the list
    public void AddLast(int value) {
        Node newNode = new Node(value);
        if (_head is null || _tail is null) {
            _head = newNode;
            _tail = newNode;
        }
        else {
            newNode.Prev = _tail;
            _tail.Next = newNode;
            _tail = newNode;
        }
    }

    //Remove the value from the beginning of the list
    public void RemoveFirst() {
        if (_head == _tail) {
            _head = null;
            _tail = null;
        }
        else if (_head is not null) {
            _head.Next!.Prev = null; 
            _head = _head.Next; 
        }
    }

    //Remove the value from the end of the list
    public void RemoveLast() {
        if (_tail != null){
            if (_tail.Prev != null) _tail.Prev.Next = null; 
            _tail = _tail.Prev;
        }
    }

    IEnumerator IEnumerable.GetEnumerator() {
        return this.GetEnumerator();
    }

    public IEnumerator<int> GetEnumerator() {
        var curr = _head; 
        while (curr is not null) {
            yield return curr.Data;
            curr = curr.Next; 
        }
    }

    public override string ToString() {
        return "<LinkedList>{" + string.Join(", ", this) + "}";
    }
}