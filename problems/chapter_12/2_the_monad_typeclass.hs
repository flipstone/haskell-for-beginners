-- Use Monad functions to wrap these
-- values in the Maybe monad.
--
foo = undefined "foo" :: Maybe String
one = undefined 1 :: Maybe Integer
threes = undefined [3,3,3] :: Maybe [Integer]


-- Use >>=, return, and the values above
-- to calculate the following values
--
oof = undefined
two = undefined


-- Re-define your byTwo and byFour functions
-- from the previous section, but use the
-- Monad typeclass to make them work for all
-- Monads.
--
byTwo :: Monad m => Integer -> m Integer
byTwo = undefined

byFour :: Monad m => Integer -> m Integer
byFour = undefined


-- Perform the same calculations as in the previous
-- section
calculations :: [Maybe Integer]
calculations = [
    -- 7 and 8 divided by two
    -- 7, 8, 10 divided by four
  ]

