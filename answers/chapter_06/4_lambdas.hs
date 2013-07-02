-- Define the following funtions using lambda
-- notation.

timesTwo :: Num a => a -> a
timesTwo = \x -> x * 2

triangleArea :: Fractional a => a -> a -> a
triangleArea = \base height -> (base * height) / 2

jamesBondIntroduction :: String -> String -> String
jamesBondIntroduction = \james bond -> bond ++ ", " ++ james ++ " " ++ bond

rectangularVolume :: Num a => a -> a -> a -> a
rectangularVolume = \length width height -> length * width * height

-- Use lambdas to perform the following maps and filters

-- Compute the areas of these rectangles: [(1,2),(3,4),(5,6)]
rectAreas = map (\(l,w) -> l * w) [(1,2),(3,4),(5,6)]

-- Pick out all the vowels from "Bond, James Bond"
bondVowels = filter (\c -> c `elem` "aeiou") "Bond, James Bond"

-- Write a function to pick out all the numbers in a list greater
-- than a given number

findAllGreaterThan :: Ord a => a -> [a] -> [a]
findAllGreaterThan n = filter (\x -> x > n)

