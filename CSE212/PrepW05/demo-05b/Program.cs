//CSE 212 Lesson 5B

//Find all the user names that logged in at least once.

//Read all user names from the 'login.txt' file.  Put the user names into a set.  
//Duplicates will be ignored.  The resulting set will be the individuals who
//logged in at least once.

var usernames = new HashSet<string>();
foreach (var line in File.ReadLines("login.txt")) {
    var record = line.Split(',');
    usernames.Add(record[0]);
}

Console.WriteLine(string.Join(", ", usernames));
