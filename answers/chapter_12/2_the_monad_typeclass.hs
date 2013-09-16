-- Use Monad functions to wrap these
-- values in the Maybe monad.
--
foo = return "foo" :: Maybe String
one = return 1 :: Maybe Integer
threes = return [3,3,3] :: Maybe [Integer]


-- Use >>=, return, and the values above
-- to calculate the following values
--
oof = foo >>= (\x -> return (reverse x))
two = one >>= return . (+1)


-- Re-define your byTwo and byFour functions
-- from the previous section, but use the
-- Monad typeclass to make them work for all
-- Monads.
--
byTwo :: Monad m => Integer -> m Integer
byTwo n = if n `mod` 2 == 0
          then return (n `div` 2)
          else fail "Not a multiple of 2"

byFour :: Monad m => Integer -> m Integer
byFour n = byTwo n >>= byTwo


-- Perform the same calculations as in the previous
-- section
calculations :: [Maybe Integer]
calculations = [
    byTwo 7,
    byTwo 8,
    byFour 7,
    byFour 8,
    byFour 10
  ]

