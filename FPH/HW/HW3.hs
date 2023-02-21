--Sam Grivas
--1. Write a function flatten that takes a list of lists and flattens it to a single list. For example, flatten [[1,2,3], [4,5,6,7], [8,9,10,11,12] ] produces the list [1,2,3,4,5,6,7,8,9,10,11,12]
flatten :: [[a]] -> [a]
flatten [] = []
flatten [[a]] = [a]
flatten (x: xs) = x++ flatten xs
--2. Write a function remdups that removes all duplicates from a list.
--remdups :: [a] -> [a]
remdups [] = []
remdups [x] = [x]
remdups (x1:x2:xs) = if x1 == x2 then remdups(x2:xs) else x1:remdups(x2:xs) 
--not sure how to get this to find duplicates that aren't next to eachother on the list

--3. Write a function scanSum that adds the items in a list and returns a list of the running totals. So, scanSum [2,3,4,5] returns [2,5,9,14]. (from HWIB, Lists II)

scanSum' xs = scanSum' n xs
    where
        n = length xs
        scanSum' 0 _ = []
        scanSum' n xs = scanSum' (n-1) xs ++ [sum (take n xs)]


--4. Write a function group that takes a list and returns a list of lists such that the concatenation of the result is equal to the original argument. Each sublist in the result contains only equal elements. For example, group "Mississippi" produces [ "M", "i", "ss", "i", "ss", "i", "pp", "i"].




--5. Write a function listDiff with two lists as parameters that deletes every occurrence of every element of the second list from the first list. This is analogous to a set difference.

--6. Implement a Run Length Encoding (RLE) encoder and decoder. The idea of RLE is simple; given some input: "aaaabbaaa" compress it by taking the length of each run of characters:(4,'a'), (2, 'b'), (3, 'a') The flatten and group functions from above might be helpful. What is the type of your encode and decode functions? (from HWIB, Lists II)