namespace prove_05;

public static class SetTests {
    public static void Run() {
        Console.WriteLine("\n=========== PROBLEM 1 TESTS ===========");
        var s1 = new HashSet<int>(new[] { 1, 2, 3, 4, 5 });
        var s2 = new HashSet<int>(new[] { 4, 5, 6, 7, 8 });
        Console.WriteLine(Intersection(s1, s2).AsString()); // <Set>{4, 5}
        Console.WriteLine(Union(s1, s2).AsString()); // <Set>{1, 2, 3, 4, 5, 6, 7, 8}
        Console.WriteLine("---------");

        s1 = new HashSet<int>(new[] { 1, 2, 3, 4, 5 });
        s2 = new HashSet<int>(new[] { 6, 7, 8, 9, 10 });
        Console.WriteLine(Intersection(s1, s2).AsString()); // <Set>{}
        Console.WriteLine(Union(s1, s2).AsString()); // <Set>{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
        
        Console.WriteLine("\n=========== PROBLEM 2 TESTS ===========");
        DisplayPairs(new[] { "am", "at", "ma", "if", "fi" });
        // ma & am
        // fi & if
        Console.WriteLine("---------");
        DisplayPairs(new[] { "ab", "bc", "cd", "de", "ba" });
        // ba & ab
        Console.WriteLine("---------");
        DisplayPairs(new[] { "ab", "ba", "ac", "ad", "da", "ca" });
        // ba & ab
        // da & ad
        // ca & ac
        Console.WriteLine("---------");
        DisplayPairs(new[] { "ab", "ac" }); // No pairs displayed
        Console.WriteLine("---------");
        DisplayPairs(new[] { "ab", "aa", "ba" });
        // ba & ab
        Console.WriteLine("---------");
        DisplayPairs(new[] { "23", "84", "49", "13", "32", "46", "91", "99", "94", "31", "57", "14" });
        // 32 & 23
        // 94 & 49
        // 31 & 13
    }

    /// <summary>
    /// Performs a set intersection operation.
    /// </summary>
    /// <param name="set1">A set of integers</param>
    /// <param name="set2">A set of integers</param>
    private static HashSet<int> Intersection(HashSet<int> set1, HashSet<int> set2) {
        // TODO Problem 1.1 (don't forget to fill out the 05-prove-response.md)
        var result = new HashSet<int>();
        foreach (var value in set1) 
        {
            if (set2.Contains(value))
            {
                result.Add(value);
            }
        }
        return result;
    }

    /// <summary>
    /// Performs a set union operation.
    /// </summary>
    /// <param name="set1">A set of integers</param>
    /// <param name="set2">A set of integers</param>
    private static HashSet<int> Union(HashSet<int> set1, HashSet<int> set2) {
        // TODO Problem 1.2 (don't forget to fill out the 05-prove-response.md)
        var result = new HashSet<int>();
                        
        foreach (int value in set1) 
        {
            result.Add(value);
        }
        
        foreach (var value in set2) 
        {
            if (!set1.Contains(value))
            {
                result.Add(value);
            }
        }
                
        return result;
    }
    
    /// <summary>
    /// The words parameter contains a list of two character 
    /// words (lower case, no duplicates). Using sets, find an O(n) 
    /// solution for displaying all symmetric pairs of words.  
    ///
    /// For example, if <c>words</c> was: <c>[am, at, ma, if, fi]</c>, we would display:
    /// <code>
    /// am &amp; ma
    /// if &amp; fi
    /// </code>
    /// The order of the display above does not matter. <c>at</c> would not 
    /// be displayed because <c>ta</c> is not in the list of words.
    ///
    /// As a special case, if the letters are the same (example: 'aa') then
    /// it would not match anything else (remember no the assumption above
    /// that there were no duplicates) and therefore should not be displayed.
    /// </summary>
    /// <param name="words">An array of 2-character words (lowercase, no duplicates)</param>
    private static void DisplayPairs(string[] words) {
        // TODO Problem 2 (don't forget to fill out the 05-prove-response.md)
        HashSet<string> tempSet = new HashSet<string>(words);
        HashSet<string> tempSet2 = new HashSet<string>(words);
        foreach (string word in tempSet) 
        {
            string pair = $"{word[1]}{word[0]}";
            if(tempSet2.Contains(word) && tempSet2.Contains(pair) && word[1] != word[0])
            {
                Console.WriteLine($"{word} & {pair}");
                tempSet2.Remove(pair);
                tempSet2.Remove(word);
            }
        }
    }
}
