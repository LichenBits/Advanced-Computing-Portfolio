1. Define a Binary Tree data type (BinT t) with values stored at both leaves and internal nodes. Write the following map and foldr functions on your binary tree data type. Be sure to include tests for your code in your handin.

    a. mapT - applies a function to every value node in the tree.

    b. foldrT - folds up all elements in a binary tree with an associative operator (like (+) or (*) but not (-) and not (/) ).

Expression Trees

2. Define an Expression Tree algebraic data (Expr t) with constructors Add, Sub, Mul, Div that stand for the corresponding arithmetic operators.

3. Code a simple evaluator over Int (or Num t) expression trees that returns an Int (or more generally a Num t). Test your evaluator, including a test for divide-by-zero. You get to decide how you want to handle divide-by-zero for this first evaluator version.

4. Now convert the evaluator to a function that checks for divide by zero and returns an "Either a b" type. A divide by zero should return an error string in the "Left" constructor value and a correct calculation should return the result in the "Right" constructor value.

5. Write a wrapper function around your evaluator that evaluates an arithmetic expression (coded using your Expression Tree data type) and returns a value or prints the error message produced by the evaluator. Test your evaluator, including a test for divide-by-zero.