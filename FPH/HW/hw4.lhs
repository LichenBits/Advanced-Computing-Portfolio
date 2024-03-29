1. Check the Operator Precedence in Haskell for (.) and (money) Which of the following work in ghci and which don't? Explain why.

    head . tail [1,2] this is the only one that doesn't work because it doesn't specify what arguments are being applied to what 
    (head . tail) [1,2] 
    head . tail  [1,2]
    head.tail  [1,2]

2. Define a function composeList that composes a list of functions into a single function.

> composeList x [] = x
> composeList x (y:ys) = composeList (y x) ys

ignore
composeList'' [] = id
composeList'' (f:fs) = (f.composeList fs)
^ignore composeList''

3. Rewrite composeList as a fold.

> composeList' x ys = foldl (\a b -> b a) x ys

4. Recode your Hw2 stringToNum program as sequence of transformations using the explicit application operator ($ $).


5. Recode your Hw2 stringToNum program as a composition of functions using the "dot" composition operator (.).

6. Code a function numToString, also using the composition form, that does the inverse of your stringToNum program.

7. Write a function iter f x n that applies the function f n times to the initial value x. Assume that if n is zero or less then the value x is returned .

8. Code the function bin2int that takes a binary string of 0s and 1s and returns the value as an integer.

> bin2int :: String -> Int
> bin2int = foldl (\acc x -> 2*acc + charToInt x) 0
>   where
>     charToInt :: Char -> Int
>     charToInt '0' = 0
>     charToInt '1' = 1
>     charToInt _ = error "string contains non-binary characters."

9. Code the inverse function int2bin that takes an integer and produces a binary string of 0s and 1s. Verify that your bin2int and int2bin functions are indeed inverses of each other.

10. Using the functions curry and uncurry as a model, code functions curry3 and uncurry3 that work on triples rather than pairs.

11. Rewrite the iter function of from above as an unfold.

12. Recode bin2int function above as a fold. You might find it easier to assume the least significant digits are on the left.

13. Recode the and int2bin function above as an unfold. It works easier to assume the least significant digits are on the left.

14. Define functions
 curryList :: ([a] -> d) -> (a -> [a] -> d)
 uncurryList :: (a -> [a] -> d) -> ([a] -> d)
that work on a list of arguments rather than a tuple of arguments (CRFP). Note that from the types the curried form the function must have at least one argument.