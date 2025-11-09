# Trees

## Introduction
Trees are a type of data structure that is organized in a tree-like fasion. Trees consist of a series of nodes, which is a fancy way of saying a packet of organized information. They also contain **pointers,** which is the general way that nodes reference each other. 

## I. Organization of a Tree
In a tree, there is a **root** node, which everything else stems from. The root node then "points" (or references) to another node, and then that node points to another, and so on. A node that points to another node is the **"parent"**, and the node that is being pointed to is the **"child"**. This progression goes on until a node isn't pointing towards anything, or doesn't have a child. If a node has a parent but not a child, it is called a **"leaf"** node.

![](Trees(0).png)

## II. Binary Search Tree
A Binary Search Tree(BST) is a type of tree that sorts and contains nodes based off of rules about the information they contain. If you want to place a new item in the tree, you must first compare the data in that item to the root node. If the data is larger than the root node's data, then it is moved on to the right subtree. If it is less, it is moved to the left subtree. This comparision process is continued on until there is nothing left to compare it with.

For example, let's say that you have the tree given below. If I have another node with data "45", then it will progress through the tree as follows:
![](Tree(1).png)

Notice how this is just one way that the tree could be arranged- there are different ways that this tree could be satisfied. For example, this tree could also look like this:
![](Trees(2).png)

When a tree looks like the image above, it is called **unbalanced.** The trees used previously were **balanced.** You can determine if a tree is balanced or unbalanced by the "height" of each branch (notice that there is only one branch in the tree above). If one branch is significantly longer than another, then it is unbalanced. More specifically, the maximum height of a balanced tree can be found with this equation: $h = \lfloor \log_2(n) \rfloor$. "h" is the maximum height that the tree can be, and "n" is the number of nodes. (The fancy brackets just mean to round up to the closest whole number.) If one of the branches of the tree is longer than this, the tree is not balanced.

## III. Common Operations with Efficiencies

The reason we care trees being balanced/unbalanced is because balanced trees are much more efficient. The following are common operation that are used with a tree, along with their efficiencies in Big O notation. Notice that the efficiencies are different based off of if the tree is balanced or not.

| Operation |   Description |   Efficiency(BST)   |   Efficiency(not BST)   |
|:---------|:-----------|:------------|:------------|
|Delete|Removing a node from a tree|O(log n)|O(n)|
|Insert|Adding a node to a tree|O(log n)|O(n)|
|Contains|Checking if a tree contains a certain node|O(log n)|O(n)|
|Empty|Checking if the tree is empty|O(1)|O(1)|
|Traverse|Iterate through all the objects from the tree|O(n)|O(n)|

The operations for a tree can be very complicated, and often use the concept of **recursion**. Recursion itself can be 
a difficult concept to grasp, so it would be prudent to briefly review it before moving forward. If this is necessary, you can do so here: [Recursion](https://github.com/byui-cse212/fa24-final-project-Sethricks340/blob/main/3.5%20-%20Recursion.md)


## IV. Example Problem
Let's go over a few of the operations for a tree. These will include: Insert, Traverse, and Contains.

### IV.I Insert
Let's say that a Node is defined as follows:
```csharp
public class Node {
    public int Data { get; set; }
    public Node? Right { get; set; }
    public Node? Left { get; set; }

    //Constructor
    public Node(int data) {
        this.Data = data;
    }
}
```

In this setup, the Node class will be "dumb" and the BinarySearchTree class will be "smart." All this means is that
the Node holds the basic data, and the BinarySearchTree does the operations.
Let's say that a BinarySearchTree is defined as having a root node as it's only attribute. The rest of the 
class is functions that works through the "_root" note. The BST inherits from IEnumerable, which makes it so that we can iterate through the tree. This is also how we can print the values in the tree, by iterating through them and combining them into a string. We also use this to traverse, but we'll get to that in a second.

```csharp
public class BinarySearchTree : IEnumerable<int> {
    private Node? _root;
    ...
    ...
    
    IEnumerator IEnumerable.GetEnumerator() {
        // call the generic version of the method
        return GetEnumerator();
    }

    public IEnumerator<int> GetEnumerator() {
        var numbers = new List<int>();
        //we'll worry about TraverseForward later
        TraverseForward(_root, numbers);
        foreach (var number in numbers) {
            yield return number;
        }
    }

    //uses the enumerator to go through the tree and join it together to a tree
    public override string ToString() {
        return "<Bst>{" + string.Join(", ", this) + "}";
    }
}
```

The first operation that we will work with is Insert. We will have a function called "Insert," that will only be called once, and only cares about if the _root node is null or not. The second function is "InsertNode," which will be called recursively through the the tree. Try looking through this code, following it along through the tree.
```csharp
public void Insert(int value) {
    // Create new node
    Node newNode = new Node(value);
    // If the list is empty, then point root to the new node.
    if (_root is null) _root = newNode;
    // If the list is not empty, then only root will be affected.
    else InsertNode(_root, value);
}

public void InsertNode(Node node, int value) {
    //This doesn't allow duplicates
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
        if (Right is null) node.Right = new Node(value);
        //else keep iterating
        else InsertNode(node.Right, value);
    }
}
```

We'll have a separate class for testing. We'll define a tree, then insert values into it. When we print out the values, you will notice that there are no duplicate values as expected. 
```csharp
namespace ds3Example;

public static class TreesTester {
    public static void Run() {
        BinarySearchTree tree = new BinarySearchTree();
        tree.Insert(5);
        tree.Insert(3);
        tree.Insert(7);
        // After implementing 'no duplicates' rule,
        // this next insert will have no effect on the tree.
        tree.Insert(7);
        tree.Insert(4);
        tree.Insert(10);
        tree.Insert(10);
        tree.Insert(1);
        tree.Insert(1);
        tree.Insert(6);
        tree.Insert(6);
        // When we print out the values, it will be: 1, 3, 4, 5, 6, 7, 10
    }
}
```

### IV.II Traverse

Let's move on to traversing. There's not much that we need to add to our BST, only the TraverseForward method.
This method uses recursion to go all the way to the left of the tree (the smallest value) and then go to the right. This means that we will vist all of the values in order of least to greatest value.
```csharp
private void TraverseForward(Node? node, List<int> values) {
    if (node is not null) {
        TraverseForward(node.Left, values);
        values.Add(node.Data);
        TraverseForward(node.Right, values);
    }
}

///In TreeTester
//Iterating through the tree that we created before will return the following:
Console.WriteLine(tree.ToString()); // 1, 3, 4, 5, 6, 7, 10
```

### IV.III Contains
Now let's continue on to the Contains method implementation. Similar to the Insert, we have two functions in the BST class. First we have the Contains method that handles whether the root node is null or not. Then we continue on to the ContainsNode method, which recursively calls itself until it finds (or doesn't find) the given value. 
```csharp
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
        ////A value exists, lets go compare it
        //remember to return the value, or it won't be saved up the chain
        else return ContainsNode(node.Right, value);
    }
}
```

To test whether our Contains function works, we will print to the screen the boolean value that is returned 
by Contains.
```csharp
    //In TreeTester class: current tree - // 1, 3, 4, 5, 6, 7, 10
    Console.WriteLine(tree.Contains(6)); //returns true
    Console.WriteLine(tree.Contains(7)); //returns true
    Console.WriteLine(tree.Contains(2)); //returns false
    BinarySearchTree tree1 = new BinarySearchTree(); //create an empty tree for testing
    Console.WriteLine(tree1.Contains(2)); //returns false
```
If you would like to run this example code for yourself, it can be found here: [TreeExample](https://github.com/byui-cse212/fa24-final-project-Sethricks340/tree/main/ds3-example)

## V. Problem to Solve
Now it's your turn! We're going to make a tree that's a little different this time. It's still going to be a BST, but the nodes are also going to hold a string value. To demonstrate this, we'll call it a "Family Tree" where everyone has an age and a name. Your job is to create the insert function, and implement GetNames and GetAges functions.  

Note: Something interesting about the BST class that has been created for you is that it is now inheriting from IEnumerable<Tuple<int,string>>, which means that we can iterate through the tree and return both the age and the name of each person. However, it would be easier for you to use the TraverseForward method already created for you in order to write your GetNames and GetAges functions.

The problems for you to solve are in the BST class of the project folder.
The folder for this project can be found here: [TreeProblem](https://github.com/byui-cse212/fa24-final-project-Sethricks340/blob/main/ds3-problem/BST.cs)

Please do not look at the solution to this problem until you have attempted it yourself. When you are ready, 
the solution code can be found here: [TreeSolution](https://github.com/byui-cse212/fa24-final-project-Sethricks340/blob/main/ds3-solution/BST.cs)