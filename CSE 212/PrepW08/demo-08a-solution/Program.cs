namespace demo_08a;

// CSE 212 Lesson 8A 
// Use recursion to display a word forward and backwards.
public static class Program {
    private static void DisplayForwards(string word) {
        if (word.Length == 0)
            return;
        Console.WriteLine(word[0]);
        DisplayForwards(word[1..]);
    }

    private static void DisplayBackwards(string word) {
        if (word.Length == 0)
            return;
        DisplayBackwards(word[1..]);
        Console.WriteLine(word[0]);
    }

    private static void Main() {
        DisplayForwards("Recursion");
        Console.WriteLine("=====================");
        DisplayBackwards("Recursion");

        // Notes about array/string Slicing:

        // word[a..] - Index 'a' to the end
        // word[..a] = Index 0 to 'a' (not including 'a')
        // word[..] = Include everything (copy the array)
        // word[a..b] = Index 'a' to 'b' (not including 'b')

        // When slicing a list, it creates a new array.  A common trick
        // to copy an array is to do: newArray = array[..]
    }
}