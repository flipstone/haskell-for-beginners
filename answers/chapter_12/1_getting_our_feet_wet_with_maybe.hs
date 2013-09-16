-- Define the applyMaybe function so we can apply
-- functions that produce Maybe values to Maybe
-- values
--
applyMaybe :: Maybe a -> (a -> Maybe b) -> Maybe b
applyMaybe Nothing _ = Nothing
applyMaybe (Just x) f = f x

-- Define a function that divides an integer by 2
-- if it is even, but produces Nothing if given an
-- odd integer.
--
byTwo :: Integer -> Maybe Integer
byTwo n = if n `mod` 2 == 0
          then Just (n `div` 2)
          else Nothing

-- Try out your byTwo function on 7 and 8
--
sevenByTwo = byTwo 7
eightByTwo = byTwo 8

-- Using your byTwo function and applyMaybe, define a
-- function that divides multiples of 4 by 4, producing
-- Nothing if the number is not a multiple of 4.
--
byFour n = applyMaybe (byTwo n) byTwo

-- Try out your byFour function on 7,8, and 10
--
sevenByFour = byFour 7
eightByFour = byFour 8
tenByFour = byFour 10

