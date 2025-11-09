namespace demo_01a;

public class Song
{
    public string _name;
    public int _length;
    public Song(string name, int length)
    {
        _name = name;
        _length = length;
    }
    
    // Add name & length properties
    
    // Add play method

    public void Play()
    {
        Console.WriteLine($"Play {_name} for {_length} seconds");
    }

    public override string ToString()
    {
        return $"{_name} - {_length}";
    }
}