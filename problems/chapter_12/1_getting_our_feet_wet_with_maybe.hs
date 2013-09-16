-- Define the applyMaybe function so we can apply
-- functions that produce Maybe values to Maybe
-- values
--
applyMaybe :: Maybe a -> (a -> Maybe b) -> Maybe b
applyMaybe = undefined

-- Define a function that divides an integer by 2
-- if it is even, but produces Nothing if given an
-- odd integer.
--
byTwo :: Integer -> Maybe Integer
byTwo = undefined

-- Try out your byTwo function on 7 and 8
--
sevenByTwo = undefined
eightByTwo = undefined

-- Using your byTwo function and applyMaybe, define a
-- function that divides multiples of 4 by 4, producing
-- Nothing if the number is not a multiple of 4.
--
byFour = undefined

-- Try out your byFour function on 7,8, and 10
--
sevenByFour = undefined
eightByFour = undefined
tenByFour = undefined

