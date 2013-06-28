-- Add parentheses to the following function definitions
-- to express the curried nature of the functions used,
-- but preserve the functions' behavior.

abc = ((take) 3) "abcdefg"
triples = (((zip3) "abc") [1,2,3]) [10.0, 12.0, 14.0]
ten = ((*) 5) 2
ten' = (5 *) 2


-- Add type declarations to the following functions.
-- Use parentheses to explicitly express the curried
-- nature of the functions.

and :: Bool -> (Bool -> Bool)
and a b = a && b

volume :: Int -> (Int -> (Int -> Int))
volume a b c = a * b * c

addition :: Int -> (Int -> Int)
addition = (+)

-- Implement the following functions using partial
-- application and sections.

take10 :: [a] -> [a]
take10 = take 10

tenTimes :: a -> [a]
tenTimes = replicate 10

timesTen :: Num a => a -> a
timesTen = (*10) -- or (10*)

tenNTimes :: Int -> [Integer]
tenNTimes = (`replicate` 10)

-- The makeRecord function below makes triples based on the name, age, and
-- weight information about an individual. Implement the convenience functions
-- below to make specific kinds of records. Use partial application to mention
-- as few variables as possible.

makeRecord :: String -> Int -> Float -> (String, Int, Float)
makeRecord name age weight = (name, age, weight)

namedBob = makeRecord "Bob"
bobAt30Years = namedBob 30
aliceAt30Years = makeRecord "Alice" 30
aged40 = (`makeRecord` 40)
weighs170pt5 x y = makeRecord x y 170.5

