Pattern matching
function that says the numbers from 1 to 5 and says "not between 1 and 5" for any other number
w/o pattern matching we need if then else tree but with hask

>sayMe :: (Integral a) => a -> String
>sayMe 1 = "One!"
>sayMe 2 = "Two!"
>sayMe 3 = "Three!"
>sayMe 4 = "Four!"
>sayMe 5 = "five!"
>sayMe x = "Not between 1 and 5"

>factorial :: (Integral a) => a -> a
>factorial 0 = 1
>factorial n = n * factorial (n - 1)

this is a recursive function
if we wanted to get factoiral of 3 it computes like this
3* factoiral 2
2 * factorial 1
1 *factorial 0

or 
3* (2 * (1 factorial 0))
our base case was factorial 0 = 1 though for obvious reasons so it really ends up being
3 * (2 * (1 * 1))

pattern matching also fails if we define a function like this

>charName :: Char -> String  
>charName 'a' = "Albert"  
>charName 'b' = "Broseph"  
>charName 'c' = "Cecil"  
there is no base case so if we enter in anything other than what we've defined haskell won't know what to do! 


thing [] = []
thing [x] = [x]
thing (x1:x2:xs) = thing(x2:xs)

thing' [] = []
thing' [x] = [x]
thing' (x1:x2:xs) = x1:thing(x2:xs)

pattern matching on tuples

fst and snd extract components of pairs
lets make functions that extract the components of triples

first :: (a, b, c) ->
first (x, _, _) = x
second(_, y, _) = y
third (_, _, z) = z

_ is the same thing as * in the shell

pattern matching in list comprehension

ghci> let xs = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]  
ghci> [a+b | (a,b) <- xs]  
[4,7,6,8,11,4]   
if a pattern match fails it'll move on to next element

[1,2,3] is syntactic sugar for 1:2:3:[]

a pattern like x:xs will bind the head of the list to x and the rest of it to xs even if there's only one element so xs ends up being an empty list

something like x:y:z:zs will bind the first three elements to variables and the rest of the list to zs
Note that (x:[]) and (x:y:[]) could be rewriten as [x] and [x,y] (because its syntatic sugar, we don't need
the parentheses). We can't rewrite (x:y:_) with square brackets because it matches any list of length 2 or more.


>length ' :: (numb) => [a] -> b
>length' [] = 0
>length' (_:xs) = 1 _ length' xs

breakdown 
"ham"
not empty list
length is 1 + length' "am"
length of "am" is 1 + length' "m"
1+ (1 + length' "m")
length' "m" is 1 + length' ""
since we defined length' [] to be zero we have
1 + (1 + (1 + 0)) 


you can use "as patterns" to make your life easier. 

in this example all@ is now shorthand for (x:xs)

capital :: String -> String  
capital "" = "Empty string, whoops!"  
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]  




Guards!
guards are a way to test if some property of a value are ture or false
sounds like an if statement!

where

where can make our lives easier

bmiTell :: (RealFloat a) => a -> a -> String  
bmiTell weight height  
    | bmi <= 18.5 = "You're underweight, you emo, you!"  
    | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"  
    | otherwise   = "You're a whale, congratulations!"  
    where bmi = weight / height ^ 2  

let bindings 

cylinder :: (RealFloat a) => a -> a -> a  
cylinder r h = 
    let sideArea = 2 * pi * r * h  
        topArea = pi * r ^2  
    in  sideArea + 2 * topArea 