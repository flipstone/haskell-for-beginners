-- Define a function to remove all the elements of
-- one list from another. Given the lists [1,2,3]
-- and [5,6,1,7,2,8] it should return [5,6,7,8]

remove :: Eq a => [a] -> [a] -> [a]
remove _ [] = []
remove xs (y:ys) | y `elem` xs = remove xs ys
                 | otherwise = y:remove xs ys

-- Define a function to perform the union of two
-- lists. Any elements from the second list that
-- are already in the first should not be duplicated
-- Given the lists [1,2,3]
-- and [5,6,1,7,2,8,5] it should return [1,2,3,5,6,7,8]

union' :: Eq a => [a] -> [a] -> [a]
union' xs [] = xs
union' xs (y:ys) | y `elem` xs = union' xs ys
                 | otherwise = union' (xs ++ [y]) ys


-- Define zip3', a function that takes three lists an
-- zips them into triples, stopping at the end of the
-- shortest list.

zip3' :: [a] -> [b] -> [c] -> [(a,b,c)]
zip3' [] _ _ = []
zip3' _ [] _ = []
zip3' _ _ [] = []
zip3' (x:xs) (y:ys) (z:zs) = (x,y,z):zip3' xs ys zs


-- Define a function to count the occurrences of
-- a given element in a list
--  (Hint: you may need a helper function to do the recursion)

count :: (Eq a, Num b) => a -> [a] -> b
count x xs = count' 0 x xs
  where count' n _ [] = n
        count' n x (y:ys) | x == y = count' (n + 1) x ys
                          | otherwise = count' n x ys
