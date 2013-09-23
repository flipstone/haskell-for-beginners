import Control.Monad (guard)
import Data.List (nub)

-- Use Lists as a Monad to find all the possible
-- sentences.

data Subject = Alice | Bob | Eve deriving (Eq, Show)
data Verb = Loves | Hates deriving (Eq, Show)
data Object = Monads | Beer | Skydiving | Ninjas deriving (Eq, Show)

type Sentence = (Subject, Verb, Object)

allSentences :: [Sentence]
allSentences = do
  subject <- [Alice, Bob, Eve]
  verb <- [Loves, Hates]
  object <- [Monads, Beer, Skydiving, Ninjas]
  return (subject, verb, object)


-- Do the same as above, but use a list comprehension.
--
allSentences' :: [Sentence]
allSentences' = [
    (subject, verb, object) |
    subject <- [Alice, Bob, Eve],
    verb <- [Loves, Hates],
    object <- [Monads, Beer, Skydiving, Ninjas]
  ]

-- Write a list comprehension that finds all the
-- possible sentences where no one Hates Monads.
--
monadLove :: [Sentence]
monadLove = [
    (subject, verb, object) |
    subject <- [Alice, Bob, Eve],
    verb <- [Loves, Hates],
    object <- [Monads, Beer, Skydiving, Ninjas],
    (verb, object) /= (Hates, Monads)
  ]

-- Rewrite monadLove using do syntax and the guard function.
--
monadLove' :: [Sentence]
monadLove' = do
  subject <- [Alice, Bob, Eve]
  verb <- [Loves, Hates]
  object <- [Monads, Beer, Skydiving, Ninjas]
  guard $ (verb, object) /= (Hates, Monads)
  return (subject, verb, object)

-- The mars rover can move east, west, north, or south.
-- however, move into any ravines or off the edge of the
-- plateau. Mars looks (roughly) like this:
--
-- (0,10) (10,10)
--    +----+
--    |  | |
--    | |  |
--    |--  |
--    | -- |
--    +----+
-- (0,0)  (10,0)
--
alongX x y = (x,y)
alongY y x = (x,y)

ravines = concat [
    -- Edges
    map (alongY 0) [0..10],
    map (alongY 10) [0..10],
    map (alongX 0) [0..10],
    map (alongX 10) [0..10],

    -- East/West Ravines
    map (alongY 5) [0..5],
    map (alongY 2) [4..8],

    -- North/South Ravines
    map (alongX 4) [6,7],
    map (alongX 7) [7..10]
  ]

type Rover = (Int,Int)

-- Define a function to determine all the possible
-- destinations of driving the one move from a starting
-- position. Make sure the rover doesn't drive into
-- any ravines!
--
driveRover :: Rover -> [Rover]
driveRover (x,y) = do
  pos <- [(x+1,y),(x-1,y),(x,y+1),(x,y-1)]
  guard (not $ pos `elem` ravines)
  return pos

-- Now determine what all the possible destinations of the
-- rover are starting from (1,1) and driving 3 times.
--
destinations :: [Rover]
destinations = driveRover (1,1) >>= driveRover >>= driveRover


