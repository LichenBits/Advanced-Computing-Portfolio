1. Work through the LYAH Chapter 6 on Higher Order Functions.

2. Work through the PINH slides for Chapter 7 and do all the exercises at the end.
    1. What are higher-order functions that return functions as results better known as?
        Higher-order functions?
    2. Express the comprehension [f x | x <- xs, p x] using the functions map and filter.

map f (filter p xs)

    3. Redefine map f and filter p using foldr

3. Work through the Elementary Haskell section of the Haskell Wikibook on folds. Try the examples! Do the exercises!
    1. Define the following functions recursively (like the definitions for sum, product and concat above), then turn them into a fold: and :: [Bool] -> Bool, which returns True if a list of Bools are all True, and False otherwise. or :: [Bool] -> Bool, which returns True if any of a list of Bools are True, and False otherwise.

>and' [] = True
>and' (x:xs) = if (x == True) then and' xs else False:xs

    2. Define the following functions using foldl1 or foldr1: maximum :: Ord a => [a] -> a, which returns the maximum element of a list (hint: max :: Ord a => a -> a -> a returns the maximum of two values). minimum :: Ord a => [a] -> a, which returns the minimum element of a list (hint: min :: Ord a => a -> a -> a returns the minimum of two values).

    3.Use a fold (which one?) to define reverse :: [a] -> [a], which returns a list with the elements in reverse order. Note that all of these are Prelude functions, so they will be always close at hand when you need them. (Also, that means you must use slightly different names in order to test your answers in GHCi.)
    
4. Without looking at the Prelude write your own versions of the functions any, all, takeWhile, dropWhile. Write them in a way that will make it possible to see them as folds (ie, base case and accumulation case).
5. Without looking at the Prelude, write the functions curry and uncurry. The curry function converts a function on pairs into a curried function. The uncurry function does the reverse.
6. Do problem 15 from H99P. Do it before you look at the solutions they give, of course. Try to code one of the alternative solutions on your own.
7. Do problem 16 from H99P. Do it before you look at the solutions they give, of course. Try to code one of the alternative solutions on your own.
8. Do problem 17 from H99P. Do it before you look at the solutions they give, of course. Try to code one of the alternative solutions on your own.
9. Do problem 18 from H99P. Do it before you look at the solutions they give, of course. Try to code one of the alternative solutions on your own.
10. Without looking at the Prelude, write the simple looping function until p f a that keeps applying the function f starting at value a until the condition p holds for the function result. Write the similar function while p f a.