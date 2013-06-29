-- For all the functions you define in these problems,
-- write the type signature before you start writing
-- the definition.

-- Define a function that applies another function
-- to each element of a pair.

mapPair :: (a -> b) -> (a,a) -> (b,b)
mapPair f (x, y) = (f x, f y)

-- Use your function above to write a function
-- that scales (multiplies) a pair by a given
-- factor.

scalePair :: Num a => a -> (a,a) -> (a,a)
scalePair n = mapPair (n*)

-- Define a function that applies a function to
-- each element of a list.

mapList :: (a -> b) -> [a] -> [b]
mapList f [] = []
mapList f (x:xs) = f x : mapList f xs

mapList' :: (a -> b) -> [a] -> [b]
mapList' f xs = [ f x | x <- xs ]

-- Use your functions above to define a function that
-- scales every pair in a list of pairs by ten.

scalePairsByTen :: Num a => [(a,a)] -> [(a,a)]
scalePairsByTen = mapList (scalePair 10)

-- Define a function that accepts a function and an
-- initial value. It should return the list of values
-- produced by repeatedly applying the function to its
-- own return value.

iterate' :: (a -> a) -> a -> [a]
iterate' f x = x:iterate' f (f x)

-- Use your functions above to define a function that
-- takes a pair and returns a list of all (infinitely many)
-- pairs by scaling that pair by powers of ten.

scaleByPowersOfTen :: Num a => (a,a) -> [(a,a)]
scaleByPowersOfTen = iterate' (scalePair 10)

