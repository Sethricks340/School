using System.Collections;

namespace demo_07a;

/// <summary>
/// Implement the LinkedList data structure. The Node class below is an inner class.
/// An inner class means that its real name is related to the outer class. To create
/// a Node object, we will need to specify LinkedList.Node
/// </summary>
public class LinkedList : IEnumerable<int> {
    private Node? _head = null;
    private Node? _tail = null;

    /// <summary>
    /// Each node of the linked list will have data and links to the previous and next node.
    /// </summary>
    private class Node {
        public Node? Next { get; set; }
        public Node? Prev { get; set; }
        public int Data { get; }

        /// <summary>
        /// Initialize the node to the data provided. Initially the links are unknown
        /// so they are set to None.
        /// </summary>
        public Node(int data) {
            Data = data;
        }
    }

    /// <summary>Adds a new node at the front (i.e. the head) of the linked list.</summary>
    public void AddFirst(int value) {
        // Create the new node
        var newNode = new Node(value);

        // If the list is empty, then point both head and tail
        // to the new node.
        if (_head is null)
        {
            _head = newNode;
            _tail = newNode;
        }
        // If the list is not empty, then only head will be
        // affected.
        else
        {
            // Connect new node to the previous head
            newNode.Next = _head;
            // Connect the previous head to the new node
            _head.Prev = newNode;
            // Update the head to point to the new node
            _head = newNode;
        }
    }

    /// <summary>Removes the first node (i.e. the head) of the linked list.</summary>
    public void RemoveFirst() {
        // If the list has only one item in it, then set head and tail 
        // to None resulting in an empty list.
        if (_head == _tail) {
            _head = null;
            _tail = null;
        }
        // If the list has more than one item in it, then only head
        // will be affected.
        else if (_head is not null) {
            // Disconnect the second node from the first node
            _head.Next.Prev = null;
            // Update the head to point to the second node
            _head = _head.Next;
        }
    }

    /// <summary>
    /// Adds 'newValue' after the first occurrence of 'value' in the linked list.
    /// </summary>
    public void AddAfter(int value, int newValue) {
        // Search for the node that matches 'value' by starting at the 
        // head of the list.
        var curr = _head;
            while (curr is not null) {
            if (curr.Data == value) {
                // If the location of 'value' is at the end of the list,
                // then we will affect the tail.
                if (curr == _tail) {
                    var newNode = new Node(newValue);
                    // Connect the new node to the current tail
                    newNode.Prev = _tail;
                    // Connect the current tail to the new node
                    _tail.Next = newNode;   
                    // Set the tail to the new node
                    _tail = newNode;
                    
                }
                // For any other location of 'value', need to create a
                // new node and reconnect the links to insert.
                else {
                    var newNode = new Node(newValue);
                    // Connect new node to the node containing 'value'
                    newNode.Prev = curr;
                    
                    // Connect new node to the node after 'value'
                    newNode.Next = curr.Next;
                    
                    // Connect node after 'value' to the new node
                    curr.Next.Prev = newNode;
                    
                    // Connect the node containing 'value' to the new node
                    curr.Next = newNode;
                }

                return; // We can exit the function after we insert
            }

            curr = curr.Next; // Go to the next node to search for 'value'
        }
    }

    /// <summary>
    /// Yields all values in the linked list
    /// </summary>
    IEnumerator IEnumerable.GetEnumerator() {
        // call the generic version of the method
        return GetEnumerator();
    }

    /// <summary>
    /// Iterate forward through the Linked List
    /// </summary>
    public IEnumerator<int> GetEnumerator() {
        var curr = _head; // Start at the beginning since this is a forward iteration.
        // yield return 0;
        while (curr != null) {
            yield return curr.Data; 
            curr = curr.Next; 
        }
    }

    public override string ToString() { 
        return "[linked_list]{" + string.Join(", ", this.Select(i => i.ToString())) + "}";
    }
}