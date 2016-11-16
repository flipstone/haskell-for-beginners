-- Define a list of all Fibonacci numbers

fib :: Num a => [a]
fib = [ f n | n <- [1..] ]
  where f 0 = 0
        f 1 = 1
        f n = (f (n - 1)) + (f (n - 2))

-- Implement a recursive function to find
-- the maximum element in a list of
-- pairs of elements.

maxPairElement :: Ord a => [(a,a)] -> a
maxPairElement [] = error "Maximum of empty list"

maxPairElement [(x,y)]
  | x >= y = x
  | otherwise = y

maxPairElement ((x,y):rest) = max bigger (maxPairElement rest)
  where bigger = max x y



