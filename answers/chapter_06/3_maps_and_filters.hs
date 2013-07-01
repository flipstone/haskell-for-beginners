-- Use map and filter to construct expressions
-- for the following calculations.

-- Double all the numbers from 1 to 10
twoToTwenty = map (*2) [1..10]

-- Compute the first 20 perfect cubes.
cubes = map (^3) [1..20]

-- Greet [Bob, Alice, and Eve] by adding "Hello, " in front each name.
greetings = map ("Hello, " ++) ["Bob", "Alice", "Eve"]

-- Find all the odd numbers in [2,13,7,14,4,15,6,8,9,11]
odds = filter odd [2,13,7,14,4,15,6,8,9,11]

-- Find all the even perfect cubes greater than 30 up to 1000
evenCubes = filter (>30) (filter even (map (^3) [1..10]))

-- Create a list of all the positive even numbers (using filter)
evens = filter even [1..]

-- Create a list of all the positive even numbers (using map)
evens' = map (*2) [1..]

-- Find all the perfect squares less than 10,000
squares = takeWhile (< 10000) (map (^2) [1..])

-- Find all the proper divisors of 8128. These are the positive
-- integers that divide it evenly and are less than it.
divisors = filter dividesEvenly [1..8127]
  where dividesEvenly n = (8128 `mod` n) == 0

