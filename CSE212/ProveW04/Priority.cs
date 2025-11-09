namespace prove_04;

/*
 * CSE212 
 * (c) BYU-Idaho
 * 02-Prove - Problem 2
 * 
 * It is a violation of BYU-Idaho Honor Code to post or share this code with others or 
 * to post it online.  Storage into a personal and private repository (e.g. private
 * GitHub repository, unshared Google Drive folder) is acceptable.
 *
 */
public static class Priority {
    public static void Test() {
        // TODO Problem 2 - Write and run test cases and fix the code to match requirements
        // Example of creating and using the priority queue

        // Test Cases

        // Test 1
        // Scenario: Nothing in the list
        // Expected Result: Displays an error message
        var priorityQueue = new PriorityQueue();
        Console.WriteLine("Test 1");
        priorityQueue.Dequeue();

        // Defect(s) Found: None

        Console.WriteLine("---------");

        // Test 2
        // Scenario: Add Highest Priority First
        // Expected Result: Highest Priority Taken out first
        Console.WriteLine("Test 2");
        priorityQueue.Enqueue("3",3);
        priorityQueue.Enqueue("2",2);
        priorityQueue.Enqueue("1",1);
        Console.WriteLine(priorityQueue);
        priorityQueue.Dequeue();
        Console.WriteLine(priorityQueue);
        priorityQueue.Dequeue();
        Console.WriteLine(priorityQueue);
        priorityQueue.Dequeue();
        Console.WriteLine(priorityQueue);
        
        // Defect(s) Found: None :)

        Console.WriteLine("---------");
        
        // Scenario: Add Highest Priority last
        // Expected Result: Highest Priority taken out first
        Console.WriteLine("Test 3");
        
        priorityQueue.Enqueue("1",1);
        priorityQueue.Enqueue("2",2);
        priorityQueue.Enqueue("3",3);
        Console.WriteLine(priorityQueue);
        priorityQueue.Dequeue();
        Console.WriteLine(priorityQueue);
        priorityQueue.Dequeue();
        Console.WriteLine(priorityQueue);
        priorityQueue.Dequeue();
        Console.WriteLine(priorityQueue);

        // Defect(s) Found: None :)

        Console.WriteLine("---------");
        
        // Scenario: Add two values of equal priority 
        // Expected Result: Removes the value that was added first (closest to the front)
        Console.WriteLine("Test 4");
        
        priorityQueue.Enqueue("1",3);
        priorityQueue.Enqueue("2",3);
        priorityQueue.Enqueue("3",2);
        priorityQueue.Enqueue("4",2);
        Console.WriteLine(priorityQueue);
        priorityQueue.Dequeue();
        priorityQueue.Enqueue("5",3);
        Console.WriteLine(priorityQueue);
        priorityQueue.Dequeue();
        Console.WriteLine(priorityQueue);
        priorityQueue.Enqueue("6",3);
        priorityQueue.Dequeue();
        Console.WriteLine(priorityQueue);
        priorityQueue.Dequeue();
        Console.WriteLine(priorityQueue);
        priorityQueue.Dequeue();
        Console.WriteLine(priorityQueue);
        priorityQueue.Dequeue();
        Console.WriteLine(priorityQueue);
        
        // Defect(s) Found: The highest index was removed, but it was the one closest to the end.
        // This was fixed by removing the = sign in the index comparison. 

        Console.WriteLine("---------");
    }
}