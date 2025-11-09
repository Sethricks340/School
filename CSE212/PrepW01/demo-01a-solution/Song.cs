namespace demo_01a;

public class Song
{
    public Song(string name, int length)
    {
        Name = name;
        Length = length;
    }

    // Add name & length properties
    private string Name { get; set; }
    private int Length { get; set; }
    
    // Add play method
    public void Play()
    {
        Console.WriteLine($"Playing {Name} for {Length} seconds...");
    }

    public override string ToString()
    {
        return $"{Name} - {Length}";
    }
}