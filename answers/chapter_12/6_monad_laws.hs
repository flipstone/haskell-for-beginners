justAddOne :: Int -> Maybe Int
justAddOne x = Just (x + 1)

-- Demonstrate the left identity law with
-- the Maybe Monad
--
leftIdMaybe :: Bool
leftIdMaybe = (return 3 >>= justAddOne) ==
              (justAddOne 3)

-- Demonstrate the right identity law with
-- the Maybe Monad
--
rightIdMaybe :: Bool
rightIdMaybe = (Just 3 >>= return) == Just 3

-- Demonstrate the associative law with
-- the Maybe Monad
--
associativeMaybe :: Bool
associativeMaybe =
  ((Just 3 >>= justAddOne) >>= justAddOne) ==
  (Just 3 >>= (\x -> justAddOne x >>= justAddOne))


-- Demonstrate all 3 laws for the List Monad
--
addOneOrTwo :: Int -> [Int]
addOneOrTwo x = [x + 1, x + 2]

leftIdList, rightIdList, associativeList :: Bool
leftIdList = (return 3 >>= addOneOrTwo) == (addOneOrTwo 3)

rightIdList = ([3] >>= return) == [3]

associativeList =
  ([3] >>= addOneOrTwo >>= addOneOrTwo) ==
  ([3] >>= (\x -> addOneOrTwo 3 >>= addOneOrTwo))

