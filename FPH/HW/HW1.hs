
--1 Code the last function for lists using the built-in reverse function for lists. The last function returns the last element of a list. What will you do for the empty list?
myLast xs = head $ reverse xs

--2 Code the init function for lists using the built-in reverse function for lists. The init function returns the list of all but the last element of a list. What will you do for the empty list?
myInit xs = tail $ reverse xs
--3 Code a function that returns the first and last elements of a list as a 2-tuple (a pair). Give a type for the function. Be sure to think about what you want to do for a list of length 0 or 1.
myTups xs = (head xs, last xs)
--4 Code the function rangeProduct that computes according to the following examples . Return 0 if the second argument is smaller than the first. You decide what you want to do (if anything) for negative numbers. Write the program without recursion first and then write it with recursion
rangeProduct x y = product [x..y]

prod [] = 1
prod (x : xs) = x * prod xs
--5 Code a version of the factorial function that uses your rangeProduct function
myFact xs = rangeProduct 1 xs
-- 6 Write the power :: Integer -> Integer -> Integer function for integers without using the exponentiation operator. Code this function first without recursion and then with recursion.6 
pow x 0 = 1
pow x n = x * pow x (n-1)