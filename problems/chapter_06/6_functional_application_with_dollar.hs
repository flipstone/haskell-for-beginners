-- Use $ to cut down on the parentheses in
-- the following definitions

first10Squares = take 10 (map (^2) [1..])
someMultiplesOfThree = take 5 (filter (>100) (map (*3) [1..]))
largestBuzzUnder100 = maximum (filter (multipleOf 5) (filter (multipleOf 3) [1..99]))
  where multipleOf n x = x `mod` n == 0

-- Define a function that applies a list of functions
-- to a list of values, applying the first function to
-- the first value, the second function to the second,
-- and so forth.

