"""
 Learning lists
 -Seth Ricks
"""

# #short for list()
# clients = ["Emily", "John" , "Mary"]

# #or

# clints = []

# clients.append("Emily")
# clients.append("John")
# clients.append("Mary")

# # useful for inputing people and putting in a list

# new_client = ""
# while new_client != "quit":
#     new_client = input("What is the name of the client? ")
#     clients.append(new_client)

# for client in clients:
#     print(client)




# friends = ["Luc" , "Kristi" , "Rex"]
# tips = [12.25, 13.95, 8.50]

# running_total = 0

# for tip_amount in tips:
#     #running_total = running_total + tip_amount
#     running_total += tip_amount

# print(f"The total is: {running_total:.2f}")

friends = []
new_friend = ""

print()
while new_friend.lower() != "end":
    new_friend = input("Type the name of a friend: ")
    
    if new_friend.lower() != "end":
        friends.append(new_friend)

print()
print("Your friends are: ")
for i in friends:
    print(i)
print()