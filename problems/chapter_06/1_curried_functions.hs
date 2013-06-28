-- Add parentheses to the following function definitions
-- to express the curried nature of the functions used,
-- but preserve the functions' behavior.

abc = take 3 "abcdefg"
triples = zip3 "abc" [1,2,3] [10.0, 12.0, 14.0]
ten = (*) 5 2
ten' = 5 * 2


-- Add type declarations to the following functions.
-- Use parentheses to explicitly express the curried
-- nature of the functions.

and a b = a && b

volume a b c = a * b * c

addition = (+)

-- Implement the following functions using partial
-- application and sections.

take10 :: [a] -> [a]
take10 = undefined

tenTimes :: a -> [a]
tenTimes = undefined

timesTen :: Num a => a -> a
timesTen = undefined

tenNTimes :: Int -> [Integer]
tenNTimes = undefined

-- The makeRecord function below makes triples based on the name, age, and
-- weight information about an individual. Implement the convenience functions
-- below to make specific kinds of records. Use partial application to mention
-- as few variables as possible.

makeRecord :: String -> Int -> Float -> (String, Int, Float)
makeRecord name age weight = (name, age, weight)

namedBob = undefined
bobAt30Years = undefined
aliceAt30Years = undefined
aged40 = undefined
weighs170pt5 = undefined

