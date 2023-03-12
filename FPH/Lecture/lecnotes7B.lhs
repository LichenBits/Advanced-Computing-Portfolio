Modules

How you make an algebraic datatype be a member or instance of a typeclass

> lt Null (Cons _ _) = True
> lt (Cons _ _) Null = False
> lt Null Null = False
> lt (Cons a t1) (Cons b t2) = a <= b && lt t1 t2

> instance Ord a => Ord (List a) where
>   (<=) = lte

trees

generic tree

> data Tree a = Empty | Leaf a | Node (Tree a) a (Tree a)
>   deriving Show

could also be written
data Tree a = Empty | Node (Tree a) a (Tree a) 

Node Empty 1 Empty

> preOrder Empty = []
> preOrder (Leaf v) = [v]
> preOrder (Node l v r) = v : (preOrder l) ++ (preOrder r)

> inOrder Empty = []
> inOrder (Leaf v) = [v]
> inOrder (Node l v r) = (inOrder l) ++ [v] ++ (inOrder r)

> postOrder Empty = []
> postOrder (Leaf v) = [v]
> postOrder (Node l v r) = (postOrder l) ++ (postOrder r)

> t1 = Leaf 5
> t2 = Leaf 7
> t3 = Node t1 6 t2

> mapT f Empty = Empty
> mapT f (Leaf v) = (Leaf (f v))
> mapT f (Node l v r) = Node (mapT f l) (f v) (mapT f r)


Modules in Haskell

modules are for name space control

control what function make it out of the modules

we don't need to provide everything from the module

export controls
    we say what functions are visible inside our module
    we don't want the programmer to have access to all functions    

import controls

functions are first class values 