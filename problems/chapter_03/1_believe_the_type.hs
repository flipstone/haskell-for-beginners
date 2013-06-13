-- Guess the types of the following definitions.
-- Check your guesses in GHCI as you go.

a = 'a'
b = False
c = 100
d = 10.5
e = (100, "Pants")
f = ()
g = [ x*x | x <- [1..10] ]
h x = "Hello " ++ x
i x y = x ++ y ++ " Goodbye"
j x y = x:y ++ " Goodbye"

-- Add type signatures to the following function
-- definitions. If you can load the file into GHCI
-- without an error, then you have a valid signature!

-- add1 :: ???
add1 x = x + 1

hasThree ns = 3 `elem` ns

hasFoo words = "foo" `elem` words

interject before after = before ++ " - HEY! - " ++ after

isTwice x y = x == y * 2

numberThem word = zip [1..] (word ++ " more")

-- Write functions for the following type signatures.
-- Try to guess what the function should do based
-- on the name and type signature.

area :: Double -> Double -> Double
area = undefined

doubleThem :: [Int] -> [Int]
doubleThem = undefined

numberOfMs :: String -> Int
numberOfMs = undefined

-- Write type signatures *and* definitions for the following
-- functions. Guess what they should do based on the name and parameters.
-- In some cases, more than one definition or signature might be acceptable.

removeVowels string = undefined

hypotenuse a b = undefined -- hint: use sqrt

makeRects lengths widths = undefined

