namespace ds3Example;

public class Node {
    public int Data { get; set; }
    public Node? Right { get; set; }
    public Node? Left { get; set; }

    //Constructor
    public Node(int data) {
        this.Data = data;
    }
}