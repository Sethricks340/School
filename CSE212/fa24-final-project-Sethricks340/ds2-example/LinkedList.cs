using System.Collections;

namespace ds2example;

public class LinkedList : IEnumerable<int> {
    private Node? _head;
    private Node? _tail;
    public LinkedList(List<int>? data = null) //optionally null
    {
        //Add all of the data to the linked list, in order
        if (data != null) foreach (int item in data) AddLast(item);
    }

    //Add the value to the end of the list
    public void AddLast(int value) {
        Node newNode = new Node(value);
        if (_head is null || _tail is null) {
            //if there is nothing in the list, the first item is the head and the tail
            _head = newNode;
            _tail = newNode;
        }
        else {
            //process to add a node as the new tail
            newNode.Prev = _tail;
            _tail.Next = newNode;
            _tail = newNode;
        }
    }

    IEnumerator IEnumerable.GetEnumerator() {
        //call GetEnumerator
        return this.GetEnumerator();
    }

    public IEnumerator<int> GetEnumerator() {
        var curr = _head; //start at head
        while (curr is not null) {
            yield return curr.Data; 
            curr = curr.Next; // Go to next item in the list
        }
    }

    public int CountData(int value)
    {
        int count = 0;
        // Use the enumerator to iterate through the list
        foreach (int data in this) if (data == value) count++; // Increment count if the value matches
        return count;
    }
    public override string ToString() {
        return "<LinkedList>{" + string.Join(", ", this) + "}";
    }
}