Workshop 2/2/23

This is a literate Haskell file so that I can combine text and programs in one file, easily!

We are going to go over what we have covered so far,
specifically:

--  types
--  beta-reduction
--  recursion
--  list comprehensions
--  higher-order functions

I am not sure where people are in their undertanding. So
this workshop may land low or high! No problem -- don't
stress.


Here are some definitions:

> double x = 2*x
> square x = x*x
> twice f x = f (f x)
> quad = twice double
> fourth = twice square

1. What is the type quad? Do not use ghci for this. Give
your reasons for your type.
(f -> f) -> a -> b

I'm not understanding this

integer -> integer
2. What is the type of fourth? Do not use ghci for this.
Give your reasons for your type.

this seems like the same as question 1

3. Check your types in ghci. If they are different,
justify the haskell type and where your assumptions
differ. (Don't worry about the typeclass context at this
point.)

Integer -> Integer

twice f x = f (f x)

4. Generalize the twice function above to repeat with the
following specification:


repeat f 0 x yields x
repeat f 1 x yields f x
repeat f 2 x yields f (f x)
repeat f 3 x yields f (f (f x))
and so on.

> repeat' f 0 x = x
> repeat' f n x = f (repeat' f (n-1) x)


5. Here is the definition of foldl:

> foldl' f v [] = v
> foldl' f v (x:xs) = foldl' f (f v x) xs

foldl' (+) 0 [1,2,3]
== foldl' (+) ((+) 0 1) [2,3]
== foldl' (+) ((+) ((+) 0 1) 2) [3]
==foldl' (+) (((+) (+) ((+) 0 1) 2) 3) []
== ((+) ((+) ((+) 0 1) 2) 3)

Use foldl' to write a function product_left that computes
the product of a list of numbers (ints or floats)
> product_left xs = foldl' (*) 1 xs



6. What is the type of foldl'? (do it yourself and then
check in ghci, same as above.)

foldl :: (a -> b -> a) -> a -> [b] -> a

foldl' (\acc x -> acc x) 0 [1,2,3]

foldl' (+) 0 [1,2,3]


7. Write product_left' that uses recursion.


8. What are the types of product_left and product_left'?

9. Here is the definition of foldr:

> foldr' f v [] = v
> foldr' f v (x:xs) = f x (foldr' f v xs)

6. What is the type of foldr'? (do it yourself and then
check in ghci, same as above.)

7. Using beta-reduction show the computation of
foldl' (-) 0 [1,2,3].
(-((-)((-) 0 1) 2) 3

8. Using beta-reduction show the computation of
foldr' (-) 0 [1,2,3].

(-) 1 ((-) 2 ((-) 3 0))

9. Are they the same? Why or why not? Check your answer
in ghci and justify.

they are different because they the left one is 
0-1-2-3 = -6 and right one is 3-0=3, 2-3 = -1, 1- -1 = 2

10. Use a list comprehension and either fold to write
the sum_cube_odd (is the sum of the cubes from 1 to n).
so sum_cube_odd 5 should give use the sum of the cubes
[1,3,5] = 1 + 27 + 125

sum_cube_odd n = foldl (+) 0 [sum x^3 | x <- [1..n], odd x]

11. Write the same function using filter, map, and fold.

> sum_cube_odd' = foldl (+) 0 (filter (odd) (map (^3) [1..n]))

12. We introduced the compose operator (.). And PINH
introduced a composeList :: [a->a] -> a.  Here is a
definition of composeList.  What does composeList do?
(Use beta-reduction to demonstrate your explanation.)

> composeList' [f] x = f x
> composeList' (f:fs) x = f (composeList' fs x)

13. (Challenge!) Rewrite the composeList using the dot (.) operator and
either of the folds.

