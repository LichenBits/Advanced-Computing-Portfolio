
------------------------------------------------------------------------------
Haskell Midterm . Open book and notes, no computers (ghci or web surfing) for 2hrs.

If you are stuck on anything, try to work bottom up with what you do know. All
the prelude functions that I reference are defined at the bottom of this file.
I know I sound like a broken record, but if you need insight into what a
function does, use beta-reduction. If you can't quite get to a "final answer",
showing the beta-reduction will earn partial credit.
------------------------------------------------------------------------------

1. (10)
  (a) What does  the following function do? If you know the name of
the prelude function it is equivalent to, say what it is.

> unknown1 f as = [f a | a <- as]

this function takes a function and a list and applies the function to each element of the list

this is map

unknown1 (+) [1,2,3] ==
f=(+1)
as = [1,2,3]
[(+1) 1 | 1 <- [1,2,3]]

  (b) What does  the following function do? If you know the name of
the prelude function it is equivalent to, say what it is.

> unknown2 p as = [ a | a <- as, p a]

This will compare all elements in a list to a predicate 
unknown (>1) [1,2,3] = 
[1 | 1 <- [2,3], (>1) 1]
[2 | 2 <- [3], (>1) 2]
[3 | 3 <- [], (>1) 3]
==[2,3]

2. (15)
  (a) What is the type of the following unknown3 function? Give the most general
      type and include any required class constraints to the best of your understanding.

> unknown3 xs = \ys -> [(x,y) | x <- xs, y <- ys, x < y ]

  Ord a => [a] -> [a] -> [(a,a)]

  (b) Give a simple description of what the unknown3 function in part (a) does.
      Describe what it does, not how it works.

compares the elements of two lists and outputs a list of tuples such that x < y

  (c) Give a non-trivial test case of the function unknown3 and show the expected
      results.
unknown3 [3,4,5] [1,5,7]
[(3,5), (4,5), (5,7)]


3. (15)
  (a) What is the type of the following unknown4 function? Give the most general
      type and include any required class constraints (to the best of your knowledge).

> unknown4 ys = not . any (`elem` ys)

(foldable t1, Foldable t2, Eq a) => t2 a -> t1 a -> Bool
this requires two foldables as input since unknown asks for 'ys' and 'any' is being partially applied  

(The function any from the prelude is shown at the bottom of this page.)

  (b) Give a simple description of what the unknown4 function in part (a) does.
      Describe what it does, not how it works.

This function takes two lists and only returns true if no elements are the same


  (c) Give a non-trivial test case of the unknown4 function applied to two
      arguments and show the expected results.

unknown4 [1,2,3] [4,4,4]
True

unknown4[1,2,3] [1,2,3]
False





4. (15)
  (a) What is the type of the following unknown5 function? Give the most general
      type and include any required class constraints.

> unknown5 p = foldr (\x xs -> if p x then x:xs else xs) []

Foldable t => (a -> Bool) -> t a -> [a]
we're applying a predicate to a foldable list, the predicate returns a Bool, the predicate is applied to the list and it returns a list 

\x xs -> if p x then x:xs else xs
x = 4
xs = [4,6,7]
p = (<5)
if <5 4 then 4:[6,7] else [6,7]
if <5 6 then 6:[7] else [7]
if <5 7 then 7:[] else []
[6,7] 



  (b) Give a simple description of what the unknown5 function in part (a) does.
      Describe what it does, not how it works.


unknown5 applies a predicate to each element of a list and returns a list that is in line with the predicate




  (c) Give a non-trivial test case of the function unknown5 and show the
      expected results.


unknown5 (<='b') ['a','b','c']
"ab"


5. (15)
  (a) What is the type of the following unknown6 function? Give the most general
      type and include any required class constraints. The ($) is the
      low-precedence application operator. (I give several versions below, with and without the $).


> unknown6'' m n = take m ((map (\f -> f n) . map (*)) [1..])

f1 = map (\f -> n)
f2 = map (*)

(f1.f2) [1..] =
f1 (f2 [1..])

map (\f-> f n) (map (*) [1..])

function composition

(Num a, Enum a) => Int -> a -> [a]




(The 3 definitions above are identical. Use whichever one you are comfortable
with ).
Note:
*Main> ($5)(*)2 <-- prefix notation
10
*Main> (*)2$5   <-- infix notation
10
*Main> (\f -> f 5) (*2)  <-- prefix notation
10
*Main>


  (b) Give a description of what the unknown6 function in part (a) does.
      Describe what it does, not how it works.

Unknown6 takes two numbers as arguments and outputs a list. the first number will equal the length of the list and the second number will be the number that gets multiplies and fills out the list 



  (c) Give a non-trivial test case for the unknown6 function in part (a) and show
      the expected results.

unknown6 5 4
[4,8,12,16,20]






6. (15)
  (a) What is the type of the following unknown7 function? Give the most general
      type and include any required class constraints.

> unknown7 xs = all (\(x,y) -> (x<=y)) (zip xs (tail xs))

Ord a => [a] -> [(a)] -> Bool


  (b) Give a description of what the unknown7 function in part (a) does.
      Describe what it does, not how it works.

takes a list, turns the list into a list of tuples, outputs true or false depending on if each tuple follows the rule (x<=y)


  (c) Give a non-trivial test case for the unknown7 function in part (a) and show
      the expected results.

unknown7 [1,2,3,4]
True



7. (15)
  (a) What is the type of the following unknown8 function? Give the most general
      type and include any required class constraints. The function length
      returns type Int.

> unknown8 [] = []
> unknown8 (x:xs) = (length $ x : takeWhile (==x) xs, x)
>                  : unknown8 (dropWhile (==x) xs)

Ord a => [a] -> [a]?


Eq a => [a] -> [(Int, a)]
takes a list, output's the amount of time's the element appears in the list and the element in tuple form 

  (b) Give a description of what the unknown8 function in part (a) does.
      Describe what it does, not how it works.

it takes a list and outputs the occurence of each element in tuple form





  (c) Give a non-trivial test case for the unknown8 function in part (a) and
      show the expected results.
      unknown8 [1,1,2,2,3,3,3,4]
      [(2,1),(2,2),(3,3),(1,4)]



8. (15)
  (a) What is the type of the following unknown9 function? Give the most general
      type and include any required class constraints. The function length
      returns type Int.

 unknown9 [] = []
 unknown9 (x:xs) = (a , x) : b
   where
      a = length $ x : takeWhile (==x) xs
      b = unknown9 (dropWhile (==x) xs)

!!!!!!!!!!!!this one is hard for me to wrap my head aroudn doing beta reduction to 
!!!!!!!!!!!!!what does the step command tell us?

Eq a => [a] -> [(int, a)]


unknown9 [1,2,2,3,4]
xs = [2,2,3,4]
x = 1
a = length(1 : takeWhile (==1) [2,2,3,4]) = 1
b = unknown9 (dropWhile (==1) [2,2,3,4]) =  unkonwn9 [2,2,3,4] = 



  (b) Give a description of what the unknown9 function in part (a) does.
      Describe what it does, not how it works.

This does the same thing as unknown8, it takes a list and outputs a list of tuples where x is the amount of times an element appears and y is the original element




  (c) Give a non-trivial test case for the unknown8 function in part (a) and
      show the expected results.

unknown9 [1,1,2,3,3,3,3,4,4]
[(2,1), (1,2), (4,3), (2,4)]


Prelude Definition Reminders
----------------------------

elem' x (y:ys)   = x==y || elem x ys


any' _ []        = False
any' p (x:xs)    = p x || any' p xs


all' _ []        = True
all' p (x:xs)    = p x && all' p xs


foldr' f z []     = z 
foldr' f z (x:xs) = f x (foldr' f z xs) 


take' 0 _ = []
take' n [] = []
take' n (x:xs) = x:take' (n-1) xs


dropWhile' _ [] = []
dropWhile' p (x:xs)
  | p x = dropWhile' p xs
  | otherwise = (x:xs)


takeWhile' _ [] = []
takeWhile' p (x:xs)
  | p x = x:takeWhile' p xs
  | otherwise = []


length' xs = foldl (\x -> \y -> x + 1) 0  xs


zip' [] ys = []
zip' xs [] = []
zip' (x:xs) (y:ys) = (x,y):zip' xs ys


zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys


not' True = False
not' False = True


map' f [] = []
map' f (x:xs) = f x : map' f xs


(.) f g = \x -> f ( g x)

