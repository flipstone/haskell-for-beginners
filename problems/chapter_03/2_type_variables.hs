-- Add type signatures to the following functions.
-- More than one signature will work. You should
-- find the most general one (i.e. the one that uses
-- the most type variables).

doNothing x = x

takeSome xs = take 10 (drop 3 xs)

crossProduct xs ys = [ (x,y) | x <- xs, y <- ys ]

obscure xs = [ '*' | _ <- xs ]

aOrB condition a b = if condition then a else b

-- Write defintions for the following functions based
-- on their type signatures and names.

replaceSnd :: (a,b) -> c -> (a,c)
replaceSnd = undefined

join :: ([a],[a]) -> [a]
join = undefined

splitOne :: [a] -> (a,[a]) -- may fail on empty lists
splitOne = undefined

-- Write type signatures and definitions for the following
-- functions based on their names and parameters.

flipPair tuple = undefined

safeHead valueIfEmpty xs = undefined

-- NOTE: there is a standard unzip function that does this. Try to do
-- it yourself without looking.
unzipPairs listOfPairs = undefined

