-- Rewrite the following functions in a point free style
-- using composition

add3Mult10 x = 10 * (x + 3)

take3GreaterThan100 xs = take 3 $ filter (>100) xs

isoscelesHypotenuse l = sqrt $ 2 * (l^2)

applyTwice f x = f (f (x))

-- Define the following functions using point free style.

-- Define a function to find the sum of all the
-- even numbers in a list.

-- Define a function double all the odd numbers in a list
-- (and remove the even ones)

-- Define a function to find the largest x coordinate in
-- a list of points (x,y pairs)

-- Define a function to find the largest area in a list of
-- rectangles (length,width pairs)

-- Define a function to find the square of the least multiple
-- of 3 in a list


