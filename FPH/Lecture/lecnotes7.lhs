we are week 7 but everything is pushed back so we're doing week 6 content


tail recursion and lazyness

What is tail recurison?
recursive algorithm where the recursive call is the last expression to be evaluated in a fuinctoin
so the recursion is happening at the end of a function? if recursion is the last thing to be evaluated then it's tail recursion
if it's the last expression to be evaluated in a 


> len' [] = 0
> len' (x:xs) = 1 + len' xs --not tail recursive need to return value of len xs to complete the addition


len' [1,2,3] = 1 + len' [2,3]
len' [2,3] = 1 + len'[3]
len' [3] = 1 + len[]
len[] 


1+1+1+0 = 3


> len'' [] acc = acc
> len'' (x:xs) acc = len'' xs (1+acc) -- tail recursive | acc = accumulator 


len'' [1,2,3] 0 = len'' [2,3] (1+0)
len'' [2,3] 1  = len'' [3] (1+1)
len'' [3] 2 = len'' [] (1+2)
len'' [] 3 = 3


> fib 0 = 1
> fib 1 = 1
> fib n = fib (n-1) + fib (n-2)


fib 5 = fib4 + fib 3
      = fib 3 + fib 2 + fib 2 + fib 1
      = fib 2 + fib 1 + fib 1 + fib 0 + fib 1 + fib 0 + fib 1
      = fib 1 + fib 0 + fib 1 + fib 1 + fib 0 + fib 1 + fib 0 + fib 1


> fib' z = fib'' 0 z 1 1
>   where
>       fib'' x y  m n 
>           | x == y    = n
>           | otherwise = fib'' (x+1) y (m+n) m


1,1,2,3,5,8,13,...

which is tail recursive?

leg f = \x y -> x+1 
let g = \x y -> y+1

LAZY
lenfl [2,3,4,5] = foldl f (f 0 2) [3,4,5]
                = foldl f (f (f 0 )

type erasure
type checking takes time and space 
optimally type check at compile time but
if you know you're not generating a type error at rntime then get rid of the types saving space and time


Chapter 8 - Declaring Types and Classes

creating our own types 

type declarations can be nested

type Pos = (Int,Int)
type Trans = Pos -> Pos

they cannot be recursive (using the type keyword)

type Tree = (Int, [Tree]) you'd be defining tree in terms of tree

data declarations

using data declarations you can define a new type

data Bool = False | True

Bool is a new type with two new values: false and true

data Maybe a = Nothing | Just a

RECURSIVE TYPES
new types cna be decalred in terms of themselves 

data Nat = Zero | Succ Nat
Nat is a new type, wiht constructors zero  and succ

> add :: Nat -> Nat -> Nat
> add m n = int2nat (nat2int m + nat2int n)

> add' Zero n = n
> add (Succ m) n = Succ (add m n)


