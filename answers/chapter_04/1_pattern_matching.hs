-- Write a function that implements Fizz Buzz
-- (http://en.wikipedia.org/wiki/Fizz_buzz)
-- up to the number 15 with simple pattern matching.
-- After 15, give up and lose the game.
fizzBuzzLose :: Integer -> String
fizzBuzzLose 1 = "One"
fizzBuzzLose 2 = "Two"
fizzBuzzLose 3 = "Fizz"
fizzBuzzLose 4 = "Four"
fizzBuzzLose 5 = "Buzz"
fizzBuzzLose 6 = "Fizz"
fizzBuzzLose 7 = "Seven"
fizzBuzzLose 8 = "Eight"
fizzBuzzLose 9 = "Fizz"
fizzBuzzLose 10 = "Buzz"
fizzBuzzLose 11 = "Eleven"
fizzBuzzLose 12 = "Fizz"
fizzBuzzLose 13 = "Thirteen"
fizzBuzzLose 14 = "Fourteen"
fizzBuzzLose 15 = "Fizz Buzz"
fizzBuzzLose _ = "I lose!!"

-- Write functions to calculate the 2 and 3 dimensional
-- dot product using tuples and pattern matching:
--   http://en.wikipedia.org/wiki/Dot_product#Algebraic_definition
dot2 :: Num a => (a,a) -> (a,a) -> a
dot2 (a,b) (c,d) = a*c + b*d

dot3 :: Num a => (a,a,a) -> (a,a,a) -> a
dot3 (a,b,c) (d,e,f) = a*d + b*e + c*f

-- Write a function to flip the components of all the pairs in
-- a list.
flipAll :: [(a,b)] -> [(b,a)]
flipAll pairs = [(y,x) | (x,y) <- pairs]

-- Write a function that moves the first element of a list to the end.
headToEnd :: [a] -> [a]
headToEnd [] = []
headToEnd (x:xs) = xs ++ [x]

-- Write your own implementation of reverse to reverse a list
--   (your function will probably need to call itself)
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

-- Write a function to tell if a list's length is > 4.
-- Use only pattern matching to get the answer.
longerThan4 :: [a] -> Bool
longerThan4 [] = False
longerThan4 [_] = False
longerThan4 [_,_] = False
longerThan4 [_,_,_] = False
longerThan4 [_,_,_,_] = False
longerThan4 _ = True

-- Write a function that pairs up each member of a list with
-- the one after it. For the list [1,2,3] the function should
-- return the list [(1,2),(2,3)]. (@ can help you here)

conses :: [a] -> [(a,a)]
conses [] = []
conses all@(_:rest) = zip all rest


