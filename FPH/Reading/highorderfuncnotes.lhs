

the type of max is 
-- max :: (Ord a) => a -> a -> a 
or
-- max :: (Ord a) => a -> (a -> a)

calling a function with too few params we get back a partiall applied function


> multThree :: (Num a) => a -> a -> a -> a
> multThree x y z = x * y * z


what happends when we do multThree 3 5 9?
3 is applied to multThree because they're seperated by space
that creates a function that takes one param and returns a function
5 is paplied to that which creates a function that will take a parameter and multiply by 15
9 is applied to that function and we get 135

the type can also be written as
multThree :: (Num a) => a -> (a -> (a -> a))

infix functions?

to section an infix function, surround with parens and only supply a param on one side

> divideByTen :: (Floating a ) => a -> a
> divideByTen = (/10)
(/10) 5 == 5/10

> isUpperAlphanum :: Char -> Bool
> isUpperAlphanum = (`elem` ['A'..'Z'])

all functions actually only take one parameter and return partiall applied functions

> applyTwice :: (a -> a) -> a -> a
> applyTwice f x = f (f x)
 
we can use this function to apply other functions to things

applyTwice (+3) 10 
16

applyTwice (multThree 2 2) 9
144


lambdas are anonymous functions that are used bc we need some functions only once
\ is lambda in haskell
after that comes a -> and then the function body
we usually surround them by parens


foldl (-) 0 [1,2,3]
-6
((0 - 1) - 2) - 3

foldr (-) 0 [1,2,3]
2
1 - (2 - (3 - 0))
