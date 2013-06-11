-- define a list of all the letters of
-- the english alphabet (both lowercase and uppercase)
alphabet = ['A'..'Z'] ++ ['a'..'z']

-- define a list of all the numbers that are
-- a multiple of both three and five
--   (There are a lot of them!)

multiplesOfThreeAndFive = [15,30..]

-- define a list that consists of a pattern of
-- 20 ones followed by 15 zeros, repeating
--   (you can do it in 40 characters!)

onesAndZeros = cycle (replicate 20 1 ++ replicate 15 0)

