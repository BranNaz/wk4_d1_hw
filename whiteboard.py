#  find Even Numbers
# create a function that , given a list as a parameter, finds that even numbers
# inside the list. The function should then return a list.
# Example:
# Input:[2,7,10,11,12]
# Output: [2, 10, 12]


def evenNumber(li):
    even_li = []
    for num in li:
        if num % 2 == 0: 
            even_li.append(num)
    return even_li

print(evenNumber([2,7,10,11,12]))