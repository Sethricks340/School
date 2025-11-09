namespace demo_08c;

public static class Program {
    private static int Permutations(string letters, string word = "") {
        // Base Case
        if (letters.Length == 0) {
            // If there are no more letters to choose from, then
            // display the word

            // Console.WriteLine(word);
            return 1;
        }
        else {
            // Find each permutation starting with 'word' and adding
            // each of the remaining letters one at a time.
            var count = 0;
            for (int i = 0; i < letters.Length; i++) {
                // Create a new list of letters left
                var lettersLeft = letters.Remove(i, 1);

                // After adding a letter to the word, search for more 
                // permutations with the remaining letters. (recursive call)
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
    }
}