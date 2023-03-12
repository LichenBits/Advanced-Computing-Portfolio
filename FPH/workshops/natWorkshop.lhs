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

> zero = Z
> one = (S Z)
> two = S (S Z)
> three = S (S (S Z))
> four = S (S (S (S Z)))

2. Write a function int2nat that takes an Int and
constructs the equivalent Nat

> int2nat ::  Int -> Nat
> int2nat 0 = Z
> int2nat n = S(int2nat (n-1))


3. Write a function that takes a Nat and returns
the equivalent Int:

> nat2int :: Nat -> Int
> nat2int Z = 0
> nat2int (S n) = 1 + nat2int n


4. Write the comparison operators:
gt, leq, le, geq, neq

And here is a definition of gt, to get you started:

> gt :: Nat -> Nat -> Bool
> gt Z (S x) = False
> gt Z Z = False
> gt _ Z = True
> gt (S x) (S y) = gt x y

> eq :: Nat -> Nat -> Bool
> eq Z (S x) = False
> eq Z Z = True
> eq _ Z = False
> eq (S x) (S y) = True

> neq :: Nat -> Nat -> Bool
> neq Z (S x) = True
> neq Z Z = False
> neq _ Z = True
> neq (S x) (S y) = False

> leq :: Nat -> Nat -> Bool
> leq Z (S x) = True
> leq Z Z = True
> leq _ Z = False
> leq (S x) (S y) = True

> geq :: Nat -> Nat -> Bool
> geq Z (S x) = False
> geq Z Z = True
> geq _ Z = True
> geq (S x) (S y) = True

> lt :: Nat -> Nat -> Bool
> lt Z (S x) = True
> lt Z Z = False
> lt _ Z = False
> lt (S x) (S y) = True


Test your functions.

5. Write the basic arithmetic operators over Nats:

> add :: Nat -> Nat -> Nat
> add Z n = n
> add (S m) n = S (add m n)

> mul :: Nat -> Nat -> Nat
> mul Z _ = Z
> mul (S m) n = add n (mul m n)

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

creates an array of Nats from 1 to 4

ghci> map toInt $ map (\x -> S x) [one, two, three, four]

converts array of Nats to a normal array [1,2,3,4]


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
