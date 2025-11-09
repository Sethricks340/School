namespace TreeStudentProblem;

public class Node {
    public int Data { get; set; }
    public string Name { get; set; }

    public Node? Right { get; set; }
    public Node? Left { get; set; }

    //Constructor
    public Node(int data, string name) {
        this.Data = data;
        this.Name = name;
    }
}