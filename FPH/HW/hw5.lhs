1. Define a Binary Tree data type (BinT t) with values stored at both leaves and internal nodes. Write the following map and foldr functions on your binary tree data type. Be sure to include tests for your code in your handin.

> data BinT t = Leaf t | Node t (BinT t) (BinT t) deriving (Show, Eq)

 testTree = Node 1
   (Node 2 (Leaf 4) (Leaf 5))
   (Node 3 (Leaf 6) (Leaf 7))

    a. mapT - applies a function to every value node in the tree.

> mapT f (Leaf x) = Leaf (f x)
> mapT f (Node x left right) = Node (f x) (mapT f left) (mapT f right)


    b. foldrT - folds up all elements in a binary tree with an associative operator (like (+) or (*) but not (-) and not (/) ).

> foldrT :: (t -> b -> b -> b) -> b -> BinT t -> b
> foldrT f z (Leaf x) = f x z z
> foldrT f z (Node x left right) = f x (foldrT f z left) (foldrT f z right)

> sumTree :: Int
> sumTree = foldrT (+) 0 testTree

Expression Trees

2. Define an Expression Tree algebraic data (Expr t) with constructors Add, Sub, Mul, Div that stand for the corresponding arithmetic operators.

3. Code a simple evaluator over Int (or Num t) expression trees that returns an Int (or more generally a Num t). Test your evaluator, including a test for divide-by-zero. You get to decide how you want to handle divide-by-zero for this first evaluator version.

4. Now convert the evaluator to a function that checks for divide by zero and returns an "Either a b" type. A divide by zero should return an error string in the "Left" constructor value and a correct calculation should return the result in the "Right" constructor value.

> evalM (Val x) = Just x
> evalM (add t1 t2) = case (evalM t1, evalM t2) of
>                      (Just t1', Justt2') -> Just $ t1' + t2'
>                          

5. Write a wrapper function around your evaluator that evaluates an arithmetic expression (coded using your Expression Tree data type) and returns a value or prints the error message produced by the evaluator. Test your evaluator, including a test for divide-by-zero.