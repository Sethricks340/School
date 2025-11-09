namespace demo_08b;

// CSE 212 Lesson 8B
//
// Calculate the Lucas Numbers using Memoziation to improve
// performance.  The Lucas Numbers are just like Fibonacci 
//     numbers but they start with:
//
// L(1) = 2
// L(2) = 1
// L(n) = L(n-1) + L(n-2)
//
// Interestingly, the ratio of L(n)/L(n-1) approaches
//     the golden ratio (1.618033...)
public static class Program {
    private static ulong Lucas(int n, Dictionary<int, ulong>? remember = null) {
        if (remember == null) {
            remember = new Dictionary<int, ulong>();
        }

        // Base Cases
        if (n == 1) {
            return 2;
        }
        else if (n == 2) {
            return 1;
        }
        else if (remember.ContainsKey(n)) {
            return remember[n];
        }

        // Otherwise solve with recursion
        var result = Lucas(n - 1, remember) + Lucas(n - 2, remember);
        remember[n] = result;
        return result;
    }

    public static void Main() {
        Console.WriteLine(Lucas(1)); // 2
        Console.WriteLine(Lucas(2)); // 1
        Console.WriteLine(Lucas(3)); // 3
        Console.WriteLine(Lucas(4)); // 4
        Console.WriteLine(Lucas(10)); // 76
        Console.WriteLine(Lucas(90)); // 3980154972736918051 (This one will
                                        // not work if you don't have the 
                                        // 'remember' dictionary implemented).

        // Approximate golden ratio:
        Console.WriteLine((double)Lucas(91) / Lucas(90)); // 1.618033988749895
    }
}