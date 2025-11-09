namespace demo_08c;

public static class Program {
    private static int Permutations(string letters, string word = "")
    {
        // Base Case
        if (letters.Length == 0)
        {
            // If there are no more letters to choose from, then
            // display the word

            // Console.WriteLine(word);
        }
        else
        {
            var count = 0;
            // Find each permutation starting with 'word' and adding
            // each of the remaining letters one at a time.
            for (var i = 0; i < letters.Length; i++)
            {
                // Make a copy of the letters to pass to the
                // the next call to permutations.  We need
                // to remove the letter we just added before
                // we call permutations again.
                var lettersLeft = letters.Remove(i, 1);

                // Add the new letter to the word we have so far
                count += Permutations(lettersLeft, word + letters[i]);
            }
            return count;


        }
            return 0;
    }

    private static void Main() {
        var result = Permutations("ABCD");
        Console.WriteLine(result);

        Console.WriteLine("====================");

        result = Permutations("ABCDEFG");
        Console.WriteLine(result);
        
        result = Permutations("");
        Console.WriteLine(result);
    }
}