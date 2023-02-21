types!
:: reads as "has type of"

Explicit types are denoted with first letter in capital case

> removeNonUppercase :: [Char] -> [Char]
> removeNonUppercase st = [ c | c <- st, c `elem`` ['A'..'Z']]
this function has a type of [Char] -> [Char] because it maps from a string to a string

>boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]   
the last part is the predicate. the function odd returns True on an odd number and false on an even number

you can include several predicates

checking the type of == yields 

:t (==)
(==) :: (Eq a) => a -> a -> Bool

new symbol! "=>"
everything that comes before that symbol is called a class constraint ans we can read the previous type declaration like this 
the equality function takes any two values that are of the same type and returns a Bool. The type of those two values must be a member of the Eq class (class constraint)

the Eq typeclass provides an interface for testing for equality
any type where it makes sense to test for equality between two values of that type shoudl be an member of the Eq class 
all standard haskell types except for IO and functions are a part of the Eq typeclass

Ord is for types that have an ordering
:t (>=)
(>) :: (Ord a) => a -> a -> Bool

to be a member of Ord a type must be a part of Eq

members of Show can be presented as strings 

type annotations are a way of explicitly saying what the type of an expression should be 
we do this by adding "::" at the end of the expression and specifying a type

read "5" :: Int

