namespace ds3Example;

public static class TreesTester {
    public static void Run() {
        Console.WriteLine("\n=========== Inserting ===========");
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
        tree.Insert(6);
        Console.WriteLine("\nNA");

        Console.WriteLine("\n=========== Traversing ===========");
        Console.WriteLine(tree.ToString()); // 1, 3, 4, 5, 6, 7, 10

        Console.WriteLine("\n=========== Removing ===========");
        Console.WriteLine(tree.Contains(6)); //true
        Console.WriteLine(tree.Contains(7)); //true
        Console.WriteLine(tree.Contains(2)); //false
        BinarySearchTree tree1 = new BinarySearchTree();
        Console.WriteLine(tree1.Contains(2)); //false
    }
}