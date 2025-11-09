namespace TreeStudentProblem;

public static class FamilyTree {
    public static void Run() {
        BinarySearchTree FamilyTree = new BinarySearchTree();
        Console.WriteLine("\n=========== PROBLEM 1 ===========");
        FamilyTree.Insert(22, "Seth");
        FamilyTree.Insert(22, "Izzy");
        FamilyTree.Insert(47, "Stephen");
        //Allows duplicates if it's not the same name AND age
        FamilyTree.Insert(77, "Stephen");
        FamilyTree.Insert(45, "Heather");
        //Doesn't allow duplicates if it's the same name AND age
        FamilyTree.Insert(1, "Ellie");
        FamilyTree.Insert(1, "Ellie");
        Console.WriteLine(FamilyTree.ToString()); 
        //<Bst>{(1, Ellie), (22, Izzy), (22, Seth), (45, Heather), (47, Stephen), (77, Stephen)}

        Console.WriteLine("\n=========== PROBLEM 2 ===========");

        Console.WriteLine(FamilyTree.ContainsName("Ellie")); //true
        Console.WriteLine(FamilyTree.ContainsName("Ellie")); //true
        Console.WriteLine(FamilyTree.ContainsName("Brittany")); //false
        Console.WriteLine(FamilyTree.ContainsAge(40)); //false
        Console.WriteLine(FamilyTree.ContainsAge(77)); //true
        //print all the ages in order
        FamilyTree.PrintAges(); //1, 22, 22, 45, 47, 77
        //print all the names in order
        FamilyTree.PrintNames(); //Ellie, Izzy, Seth, Heather, Stephen, Stephen
    }
}