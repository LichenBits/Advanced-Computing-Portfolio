We are starting on algebraic data types --
adding new types to a Haskell script.

The data keyword introduces a new data type. So
  data T =
asserts that T is a new type. All types must start with
capital letters.

On the right hand side of the = we specify how to construct
an element of this new type. This is similar to java
constructors where you specify a method that constructs
an element of a newly defined class.

So in
  data T = C1 ... | C2 ... | C3 ...

I would be specifying three constructors that "make" a 
new element of the type T. The ... indicates that these
constructors can take arguments (these are just
placeholders for now). Constructors must start
with caps.

So here's a simple example (with no args):

data Color = Red | Yellow | Blue | Purple | Orange | Green

So now we can make  colors.

Maybe I want primary vs mixed colors:

data Primary = RedP | YellowP | BlueP

Note I had to made Red be RedP because constructors must
have unique names.

data MixedColor = PurpleM | OrangeM | GreenM

Then I can make functions on them:

> mix RedP YellowP = Orange
> mix YellowP BlueP = Green

If I want to be able to "see" the values I will add a
deriving Show line after the data line.

> data Primary = RedP | YellowP | BlueP
>   deriving Show
> data MixedColor = PurpleM | OrangeM | GreenM
>   deriving Show

> data Color = Red | Yellow | Blue | Purple | Orange | Green
>   deriving Show

Load this script and make a few colors and use mix.

OK ... that's just an intro to introducing data types.
Now let's make one that is more fun to play with.

You are going to make your own natural numbers. I am
giving you the data type.

> data Nat = Z | S Nat
>   deriving Show

Note that the S constructor takes an argument of type Nat.
Ie S Z is equivalent to 1.

1. Make the Nat equivalent of the following integers:
zero =
one =
two =
three =
four =

2. Write a function mkNat that takes an Int and
constructs the equivalent Nat

mkNat :: Int -> Nat

3. Write a function that takes a Nat and returns
the equivalent Int:

toInt :: Nat -> Int


4. Write the comparison operators:
gt, leq, le, geq, neq

And here is a definition of gt, to get you started:

> gt Z (S x) = False
> gt Z Z = False
> gt _ Z = True
> gt (S x) (S y) = gt x y

eq :: Nat -> Nat -> Bool
neq :: Nat -> Nat -> Bool
gt :: Nat -> Nat -> Bool
leq :: Nat -> Nat -> Bool
geq :: Nat -> Nat -> Bool
lt :: Nat -> Nat -> Bool

Test your functions.

5. Write the basic arithmetic operators over Nats:

add :: Nat -> Nat -> Nat
mul :: Nat -> Nat -> Nat
sub :: Nat -> Nat -> Nat (sub is not total)

Here is a simple example --

inc :: Nat -> Nat

> inc x = S x


Although one way to do these is to convert the Nats to
Ints, then do the operations, then back to Nats, don't
do it that way. Do everything within the Nat data type
and only convert when you want to print it or construct
a new constant.

6. Write some higher order fn

takeN :: Nat -> [a] -> [a]
dropN :: Nat -> [a] -> [a]


7. What do the following do?
ghci> map (\x -> S x) [one, two, three, four]
ghci> map toInt $ map (\x -> S x) [one, two, three, four]


8. Write the Nat expressions equivalent to:

1 + 2 * 3
4 * 2 + 4 * 3

9. In nat we are using prefix notation. Can you introduce
operators instead for add, sub, mul? Choosing the
associativity and precedence?
Here is a handy chart for current operators: https://self-learning-java-tutorial.blogspot.com/2016/04/haskell-operator-precedence.html
Use the same associativity for your new operators as
the current +,-, *.
(I used the operators #,@, % for add, sub, mul
respectively.)
In order to define a new operator you specify the asoc
and precedence and then the definition.

infixl 5 %%
 says that %% is an infix operator with
precedence 5, associating to the left.

(%%) x y = x:y

> infixr 5 %%
> (%%) x y = x : y

gives a definition for %%.
What does it do?

Test your operators.
