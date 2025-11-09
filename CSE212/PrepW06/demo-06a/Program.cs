/*
 * CSE 212 Lesson 6a
 * Demonstrate how dictionaries (maps) work.
 */

// Create an empty dictionary
var student = new Dictionary<string, string>();
Console.WriteLine($"Empty dictionary: {{{string.Join(", ", student)}}}");

// Add name, credits, and the major to the student.
// student.Add("name", "Seth");
student["name"] = "Seth";
student["credits"] = "107";
student["major"] = "EE";

Console.WriteLine($"Populated student: {{{string.Join(", ", student)}}}");

// Display just the student credits
var credits = student["credits"];
Console.WriteLine($"Student credits: {credits}");

// Display just the keys.
Console.WriteLine($"Keys: {string.Join(", ", student.Keys)}");

// Display just the values
Console.WriteLine($"Values: {string.Join(", ", student.Values)}");

// Display all Key/Value pairs
// Console.WriteLine($"Values: {string.Join(", ", student)}");
foreach (var pair in student)
{
 Console.WriteLine($"{pair.Key}: {pair.Value}");
}


// Remove major from the student
student.Remove("major");
Console.WriteLine($"After deleting the major: {{{string.Join(", ", student)}}}");
