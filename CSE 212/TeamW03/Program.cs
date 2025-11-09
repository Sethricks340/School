// See https://aka.ms/new-console-template for more information

using queue_stacks;

Console.WriteLine("Hello, World!");

var queue = new MyQueue();

Console.WriteLine($"Size of Queue: {queue.Size()}");
// Console.WriteLine(queue.Remove());  // error

queue.Add(10);
queue.Add(100);
queue.Add(1000);

Console.WriteLine(queue.Remove());  // 10
Console.WriteLine(queue.Remove());  // 100

queue.Add(10000);
queue.Add(100000);

Console.WriteLine($"Size of Queue: {queue.Size()}");

Console.WriteLine(queue.Remove());  // 1000
Console.WriteLine(queue.Remove());  // 10000
Console.WriteLine(queue.Remove());  // 100000