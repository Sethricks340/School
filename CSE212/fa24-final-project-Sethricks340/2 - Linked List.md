# Linked Lists
## Introduction
Linked Lists are exactly how they sound- a list of information, all linked together. Trees consist of **nodes,** which is a fancy way of saying a packet of organized information. They also contain **pointers,** which is the general way that nodes reference each other. 

## I. Organization of a Doubly Linked List
A Doubly Linked List is one that has pointers that reference both forwards and backwards in the list. Each node has two pointers, which are previous (Prev) and Next. Prev points to the previous node (the whole node, not just the data or another pointer) and Next points to the next node. This kind of 
linked list also has a head and a tail, which are the beginning and end of the list, respectively. 

![](LinkedLists(0).png)

As previously stated, the Node class will have Data, and two pointers- Next and Prev. 
```csharp
public class Node {
    //Information the Node contains
    public int Data { get; set; }
    //"next" pointer
    public Node? Next { get; set; }
    //"next" pointer
    public Node? Prev { get; set; }
    ...
}
```

When we are declaring a Linked List class, we create _head and _tail nodes, as members of the class. That way they can be easily set and nullified. 
```csharp
public class LinkedList : IEnumerable<int> {
    private Node? _head;
    private Node? _tail;
    ...
}
```

## II. Adding To a Doubly Linked List
Adding to a doubly linked list is different based off of where you are wanting to add the new node. There are three different scenarios: adding to the beginning, adding to the end, and adding somewhere in the middle. We'll review each of these in the following subsections.

### II.I Adding to the Beginning
This is what adding to the beggining of a linked list looks like conceptually. Notice that we have to make the newly added node the new head.

![](LinkedLists(1).png)

The steps to adding to the beginning of a linked list are shown below.
```csharp
//Step 1: Create new node
    Node newNode = new Node(value);

//Step 2: Connect the new node's "next" to current head
    newNode.Next = _head; 
    
//Step 3: Connect the current head's "prev" to the new node
    _head.Prev = newNode; 
    
//Step 4: Set the head as the new node
    _head = newNode; 
```

### II.II Adding to the End
This is what adding to the end of a linked list looks like conceptually. Notice that we have to make the newly added node the new tail.

![](LinkedLists(2).png)

The steps to adding to the end of a linked list are shown below.

```csharp
//Step 1: Create new node
    Node newNode = new Node(value);

//Step 2: Connect the new node's "prev" to current tail
    newNode.Prev = _tail; 
    
//Step 3: Connect the current tail's "next" to the new node
    _tail.Next = newNode;
    
//Step 4: Set the head as the new node
    _tail_ = newNode; 
```


### II.III Adding in the Middle
This is what adding in the middle of a linked list looks like conceptually.

![](LinkedLists(3).png)

Adding to the middle of a linked list is a little bit more complicated. It requires looping through the list, and finding the position where the node is to be added. For example, you may be wanting to add a node after a certain node. Once this node is found, the following steps can be taken, shown below.

```csharp
//Step 1: Create new node
    Node newNode = new Node(value);

//Step 2: Connect the new node's "prev" to current node
    newNode.Prev = current;
    
//Step 3: Connect the new node's "next" to current node's "next"
    newNode.Next = current.Next;

//Step 4: Set the node after current's "prev" to the new node
    current.Next.Prev = newNode;
    
//Step 5: Set the current node's "next" to the new node
    current.Next = newNode;
```

To find the location for the new node to be inserted, we must loop through the list. This can be done with a while loop, moving through the list using the next pointer of the current node. We will do this until the criteria of the current node is matched, and we can insert. 

```csharp
public void AddAfter(int value, int newValue) {
    var curr = _head;
        while (curr is not null) {

            if (curr matches criteria){
                //Inserting logic (create new node using newValue)
                ...
                return; // Return out of the function after inserting
            }
            
            curr = curr.Next; // Go to the next node to search for node with data that matches "value"
        }
    }
```

## III. Removing from a Doubly Linked List
The cases for removing from a doubly linked list are the same for adding. We'll review each of these in the following subsections.

### III.I Removing from the Beginning
This is what removing from the beginning of a linked list looks like conceptually. Notice that we have to create a new head, which is the second node. 

![](LinkedLists(4).png)

The steps to removing from the beginning of a linked list are shown below.

```csharp
//Step 1: Set the second node's “prev” to null 
_head.Next.Prev = null;

//Step 2: Set the second node to head
_head = _head.Next;
```

### III.II Removing from the End
This is what removing from the end of a linked list looks like conceptually. Notice that we have to create a new tail, which is the second to last node.

![](LinkedLists(5).png)

The steps to removing from the end of a linked list are shown below.

```csharp
//Step 1: Set the second to last node's “next” to null 
_tail.Prev.Next = null;

//Step 2: Set the second to last node to tail
_tail = _tail.Prev;
```

### III.III Removing from the Middle
This is what removing from the middle of a linked list looks like conceptually.

![](LinkedLists(6).png)


Removing from the middle of a linked list is a little bit more complicated. It requires looping through the list, and finding the node to be removed. Once this node is found, the following steps can be taken, shown below.

```csharp
//Step 1: Set node after current's "prev" to the node before current
current.Next.Prev = current.Prev;

//Step 2:Set the node before current's "next" to the node after current
current.Prev.Next = current.Next
```
Finding the location of the node to be removed requires the same process as shown above in "Adding in the Middle."


## IV. Common Operations with Efficiencies
The following are common operation that are used with doubly linked lists, along with their efficiencies in Big O notation. Notice that the most efficient operations involve the head and tail, and the least effiecient involve nodes in the middle of the list.

| Operation |   Description |   Efficiency   |
|:---------|:-----------|:------------|
|Clear|Clear the linked list|O(1)|
|Insert Head|Insert new node as the head of the linked list|O(1)|
|Remove Head|Remove the head from the linked list, and make the second node the new head|O(1)|
|Insert Tail|Insert new node as the tail of the linked list|O(1)|
|Remove Tail|Remove the tail from the linked list, and make the second to last node the new tail|O(1)|
|Insert in Middle|Insert new node somewhere in the middle|O(n)|
|Remove in Middle|Remove a node currently in the middle of the linked list|O(n)|

## V. Example Problem
Let's go ahead and go through an example of using a linked list. With this example, we're going to create a "CountData" method that counts the number of times certain data shows up in the list.

In order to do this, we need to use the IEnumerator interface. Notice how our Linked List class above inherited from this interface. What this means is that we can use the GetEnumerator() method built into it. This allows us to 
loop through the linked list. Below is what calling the generic version of the method looks like. 

```csharp
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
```

Using this, let's declare a CountData method. This method uses the enumerator to iterate through the list, 
counting how many times the given data 'value' matches the data in one of the nodes. 
```csharp
public int CountData(int value)
{
    int count = 0;
    // Use the enumerator to iterate through the list
    foreach (int data in this) if (data == value) count++; // Increment count if the value matches
    return count;
}
```
Let's test it. In the LinkedList class, I've created a constructor that allows us to declare all of the data in the 
linked list without having to add them manually in our tester class. When we use the CountData method, it behaves as desired. 
```csharp
//created a new constructor that allows us to add data directly, or could be null
LinkedList linkedlist = new LinkedList(new List<int> { 1, 3, 7, 5, 7, 3, 3 });
Console.WriteLine(linkedlist.CountData(3)); //3
Console.WriteLine(linkedlist.CountData(7)); //2
```

If you would like to run this example code for yourself, it can be found here: [LinkedListExample](https://github.com/byui-cse212/fa24-final-project-Sethricks340/tree/main/ds2-example)


## VI. Problem to Solve
Now it's your turn! Using a linked list, solve the following problem:
It's your job to implement a stack using a linked list. The stack class has a linkedlist variable it uses to access the linked list methods. The files have been created for you, you just have to implement the linkedlist methods as new stack methods. It is your job to create the Pop, Push, and Peek stack methods, using the methods already created for the linked list. This problem for you to solve is inside of "Stack.cs".

There is also a Tester class, which have tests written for you. Do not edit these tests. Your job is to create the methods correctly so that these tests are true.

The file of this project can be found here: [LinkedListProblem](https://github.com/byui-cse212/fa24-final-project-Sethricks340/blob/main/ds2-problem/Stack.cs)

Please do not look at the solution to this problem until you have attempted it yourself. When you are ready, 
the solution code can be found here: [LinkedListSolution](https://github.com/byui-cse212/fa24-final-project-Sethricks340/blob/main/ds2-solution/Stack.cs)