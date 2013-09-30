import Control.Monad

-- Use liftM to reverse the following strings
--
possibleFoo = Just "foo"
fooAndFriends = ["foo", "bar", "baz"]
theRightFoo = Right "foo"
gimmeSomeFoos = (\n -> take n (cycle "foo"))


-- Use return and `ap` to perform the following operations
--
concatFooBar = undefined
  where foo = Just "foo"
        bar = Just "bar"

possibleSums = undefined
  where possibleXs = [1,2,3]
        possibleYs = [4,5,6]

palindromify = undefined
  where front = id
        back = reverse


-- The propagate function computes all the points
-- that one point can spread to in a single step
-- of time.
--
propagate :: (Int,Int) -> [(Int,Int)]
propagate (x,y) = [
    (x - 1, y + 1), (x, y + 1), (x + 1,y + 1),
    (x - 1, y),     (x,y),      (x + 1,y),
    (x - 1, y - 1), (x, y - 1), (x + 1,y - 1)
  ]

-- Using liftM and join instead of >>=, compute
-- all the points propagated to in 3 steps of time
-- from (0,0)
--
propagate3 = undefined


-- The teleport function defines all the points exactly
-- n away from the provided point.
--
teleport :: (Int,Int) -> Int -> [(Int,Int)]
teleport (x,y) n = [
    (x - n, y + n), (x - n, y - n),
    (x + n, y + n), (x + n, y - n)
  ]


-- Use foldM to compute all the possible destinations
-- starting from (0,0) and teleporting 3 times. The
-- first teleport is distance 3, the second is distance 2,
-- and the last is distance 4.
--
destinations = undefined

