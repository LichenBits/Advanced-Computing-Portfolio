a collaboration betweel a class and a constructor

algebraic data types

no memory allocated in haskell, constructors are better thought of as text strings
they're called a discriminated unionbecause they're tagged with how they were constructed

the tag is the constructor

> app Null t = t
> app t Null = t
> app (Cons a t) t2 = Cons a (app t t2)
