-- You're going to judge an archery contest. The
-- contests are each going to take some number of
-- shots at a number of targets. Each target has
-- a target area and a point value. The target area
-- is a circle centered on an x,y point with a given
-- radius. Any shot that lands within the target
-- scores the value of the target in points. A shot
-- will only hit the *first* target it is found to
-- be within.
--
-- Define a function to calcuate the total score for
-- a series of shots made by a contestant, given a
-- list of targets. Use record syntax to define your
-- types, and separate your solution into as many functions
-- as you deem appropriate.
--

import Data.List (find)

data Point = Point { x :: Float, y :: Float }
data Target = Target { center :: Point,
                       size :: Float,
                       value :: Int }
data Shot = Shot { point :: Point }

score :: [Target] -> [Shot] -> Int
score targets = foldr (+) 0 . map (shotValue targets)

shotValue :: [Target] -> Shot -> Int
shotValue targets shot =
  case find (hitBy shot) targets of
    Just target -> value target
    Nothing -> 0

hitBy :: Shot -> Target -> Bool
hitBy shot target = distance (point shot) (center target) <= size target

distance :: Point -> Point -> Float
distance p p' = sqrt $ (x p - x p')^2 + (y p - y p')^2

