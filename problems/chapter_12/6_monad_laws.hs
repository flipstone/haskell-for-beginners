justAddOne :: Int -> Maybe Int
justAddOne x = Just (x + 1)

-- Demonstrate the left identity law with
-- the Maybe Monad
--
leftIdMaybe :: Bool
leftIdMaybe = undefined

-- Demonstrate the right identity law with
-- the Maybe Monad
--
rightIdMaybe :: Bool
rightIdMaybe = undefined

-- Demonstrate the associative law with
-- the Maybe Monad
--
associativeMaybe :: Bool
associativeMaybe = undefined


-- Demonstrate all 3 laws for the List Monad
--
addOneOrTwo :: Int -> [Int]
addOneOrTwo x = [x + 1, x + 2]

leftIdList, rightIdList, associativeList :: Bool
leftIdList = undefined
rightIdList = undefined
associativeList = undefined

