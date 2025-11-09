namespace ds2example;

public static class LinkedListTester {
    public static void Run() {
        LinkedList linkedlist = new LinkedList(new List<int> { 1, 3, 7, 5, 7, 3, 3 });
        Console.WriteLine(linkedlist.ToString()); //<LinkedList>{1, 3, 7, 5, 7, 3, 3}
        Console.WriteLine(linkedlist.CountData(3)); //3
        Console.WriteLine(linkedlist.CountData(7)); //2
    }
}
