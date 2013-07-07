-- Rewrite the following functions in a point free style
-- using composition

add3Mult10 x = 10 * (x + 3)
add3Mult10' = (10*) . (+3)

take3GreaterThan100 xs = take 3 $ filter (>100) xs
take3GreaterThan100' = take 3 . filter (>100)

isoscelesHypotenuse l = sqrt $ 2 * (l^2)
isoscelesHypotenuse' = sqrt . (2*) . (^2)

applyTwice f x = f (f (x))
applyTwice' f = f . f

-- Define the following functions using point free style.

-- Define a function to find the sum of all the
-- even numbers in a list.
sumOfEvens = sum . filter even

-- Define a function double all the odd numbers in a list
-- (and remove the even ones)
doubleOdds = map (*2) . filter odd

-- Define a function to find the largest x coordinate in
-- a list of points (x,y pairs)
maxX :: Ord a => [(a,a)] -> a
maxX = maximum . map fst

-- Define a function to find the largest area in a list of
-- rectangles (length,width pairs)
maxArea = maximum . map area
  where area (x,y) = x * y

-- Define a function to find the square of the least multiple
-- of 3 in a list
squareLeastMultiple = (^2) . minimum . filter mult3
  where mult3 x = x `mod` 3 == 0


