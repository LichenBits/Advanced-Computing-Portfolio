 1)  Determine the types of "3", "even", and "even 3". How do you
     determine the last one?
 Now, determine the types of "head", "[1,2,3]", and "head [1,2,3]". What
     happens when applying a polymorphic function to an actual parameter?
  (hint, use the :t top level command of the Hugs interpreter).

 2) For each type, write a function with that type.

      a)   (Float -> Float) -> Float
      b)   Float -> (Float -> Float)
      c)   (Float -> Float) -> (Float -> Float)
    

3) Write the ncopies function (from Tim Sheard) that works according to the following examples. Code this function first without recursion and then with recursion.
    ncopies 3 5  gives [5,5,5]
    ncopies 0 True gives []
    ncopies 2 False gives [False, False]
    ncopies 4 "a" gives ["a","a","a","a"]

4.) Write a function diffs that returns a list of the differences between adjacent items. So, diffs [3,5,6,8] returns [2,1,2]. (HWIB, Lists II)

5) Write a function groupByN with the type:
    groupByN :: Int -> [a] -> [[a]]
This function splits the given list in sub-lists (which result in a list of lists), where the sublists have a given length. Only the last sub-list may be shorter, if necessary. An example application of the function is:
    groupByN 3 [1,2,3,4,5,6,7,8,9,10]
    [[1,2,3], [4,5,6], [7,8,9], [10]]

6) Design a way to represent straight lines in a cartesian coordinate system as internal data in Haskell (remember, y = mx + b) and then write a function that calculates the x-intercept (if any) for a given line . Be sure to test your function with some interesting cases! Note that you will NOT be doing anything graphically. This is just a very simple algebra problem.

7) Write a function which converts a string of digits into an int.
   you will need the following predefined function:
        ord ‘1’       --> 49         first char in arg to its ascii code

   follow the following "pipeline" analysis when defining your function
   "167"  --> ['1','6','7'] --> [49,54,55] --> [1,6,7] --> [(1,100),(6,10),(7,1)]
   --> [100, 60, 7] --> 167
   (hint: the first function in the pipeline is very simple. why?)
