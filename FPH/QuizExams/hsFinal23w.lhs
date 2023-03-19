
For this final:
Here are the "Do not"s:
  1.  Do not use the types from Vscode, if you  are using Vscode. 
  2.  Do not use ghci to confirm your types or code.
  3.  Do not search the web for answers.
  4.  Do not collaborate.
Here are the "Do"s:
  1.  Explain your reasoning if you are unsure
  2.  You may use any resource on the syllabus (homework solutions, lecture notes,
      examples, etc.)
  3.  Turn in what you complete in 2 hours.
  4.  You may turn in a revision to be completed by Friday at midnight.
  5.  If you do turn in a revision, you may use ghci. BUT if you do, explain your
      results and how you understand what ghci is telling you. Don't just give me
      the ghci type or computations! I am not testing ghci.

Partial credit is always an option so try to express your reasoning if you are doubtful.


> import Prelude hiding (const, or, any, map)


1.
  (a) (5) Give the Haskell polymorphic type for the map function over lists.

> map   :: (a -> b) -> [a] -> [b]

  (b) (5) Give Haskell code for the map function over lists using recursion.

> map _ [] = []
> map f (x:xs) = f x : myMap f xs 



  (c) (5) Give Haskell code for the map function over lists using list
      comprehension.

> map' _ [] = []
> map' f xs = [f x | x <- xs]







2.
  (a) (5) Give the Haskell polymorphic type for the (.) composition operator.

> (.)   :: (b -> c) -> (a -> b) -> a -> c


  (b) (5) Give the Haskell code definition for the (.) composition operator.
(extra credit: give 3 different definitions.
i) using just function application,
ii) using the $ $ operator
iii) using a lambda term)





3. Give the Haskell polymorphic types of the following functions.

  (a) (5)

> const  :: a -> b -> a

> const x _ =  x


  (b) (5)

> or  :: [Bool] -> Bool

> or = foldr (||) False


  (c) (5)

> any    :: (a -> Bool) -> [a] -> Bool

> any p = or . (map p)


  (d) (5)

> ms     :: (a -> Bool) -> (b -> a) -> [b] -> Bool

> ms p g = any p . map g



4. Consider the following binary tree data type.

> data Tree a = Nil | Node a (Tree a) (Tree a)
>           deriving (Eq, Read,Show)

  (a) (5) Give the Haskell polymorphic type for mapT, the map function over the
      binary tree data type above.

> mapT    ::  (a -> b) -> Tree a -> Tree b


  (b) (5) Give a Haskell code definition for the mapT function.

> mapT _ Nil = Nil
> mapT f (Node x left right) = Node (f x) (mapT f left) (mapT f right)





  (c) (5) Give the Haskell polymorphic type for foldrT, a foldr function over
      the binary tree data type above. Note that it doesn't have to conform to Foldable,
      BUT your type must be consistent with your definition in part (d).

> foldrT   :: (a -> b -> b) -> b -> Tree a -> b


  (d) (5) Give a Haskell code definition for the foldrT function.

> foldrT _ acc Nil = acc
> foldrT f acc (Node x left right) = foldrT f ( f x ( foldrT f acc right)) left


5. Set Abstract Data type in Haskell. Read all parts of this question before
   you answer any part of the question so you can make sure all parts of the
   code for your Set ADT implementation are consistent.

  (a) (5) What is the most essential property of Abstract Data Types in computer
      science? Name or clearly and succinctly describe the property.

  the most essential property of ADT's in computer science is encapsulation



  (b) (5) Code Haskell export controls for a Set abstract data type that gives
      a user of the module the ability to create an empty set, insert an
      element in a set, delete an element in a set, and test if an element is
      a member of a set. Your module MUST obey the essential property of
      abstract data types.

> module Set (
  Set,
  empty,
  insert,
  member,
  delete
) where 


  (c) (5) Give an appropriate type definition for the your Set abstract data
      type assuming an unordered list implementation.


> newtype Set a = Set [a]


  (d) (10) Fill in the Haskell polymorphic types and Haskell code for the Set
      abstract data type assuming an unordered list implementation.

      Again, your module MUST obey the essential property of abstract data
      types.

> empty          :: Set a

> empty = Set []
>
>
>

> insert         :: Eq a => a -> Set a -> Set a

> insert x (Set xs) = Set (x : xs)
>
>
>
>


> member         :: Eq a => a -> Set a -> Bool

> member x (Set xs) = elem x xs
>
>
>
>


> delete         :: 

> 
>
>
>
>


6. Consider the following General Tree data type.

> data GTree a = GNil | GNode a [GTree a]


  (a) (5) Give the Haskell polymorphic type for a mapGT function over GTree.

> mapGT       ::



  (b) (5) Give a code definition for the mapGT function over GTree.


