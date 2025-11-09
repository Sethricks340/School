**CSE 212 – Programming with Data Structures**

**W05 Prove – Response Document**

------------------------------------------

_It is a violation of BYU-Idaho Honor Code to post or share this document with others or to post it online.  Storage into a personal and private repository (e.g. private GitHub repository, unshared Google Drive folder) is acceptable._

------------------------------------------

**Question 1:**  From Part 1, how did you answer the interview question for the Set Operations problem (should be no more than 30 seconds if spoken aloud)?

To find the intersection between the two sets, I would loop through each value in the first set, and if that value is also in the second set, 
then I would add the value to the resultant set. I would do this using a foreach loop, the .Contains() method, and the Add() method. 

To create a union between the two sets, I would add all of the values in the first set into the resultant set. I would then loop through each 
value in the second set, and using the .Contains() method, if that value is not in the first set, then I would also add this value in the
resultant set. 

**Question 2:**  From Part 2, how did you answer the interview question for the Find Pairs problem (should be no more than 30 seconds if spoken aloud)?

To display the pairs, I would create two temporary sets. The first would be variable in size, which means that I can remove values from it so 
that duplicates like "if & fi" and "fi & if" don't happen. The second set would be to loop through. For each value, concatenate the characters 
backwards into the new word, check if both are in the first set, and if they are display them. 

------------------------------------------