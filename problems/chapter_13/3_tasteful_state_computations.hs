import Control.Monad.State

type Rover = (Int,Int)
data Direction = North | South | East | West
data Sample = Dust | Rock | Life deriving Show

-- Define a go function that accepts a Direction
-- and returns a State computation to move a Rover
-- (the State) in the Direction requested.
--
go :: Direction -> State Rover ()
go = undefined


-- Define a sample action that takes a scientific
-- Sample at the Rover's current location. You may
-- decide what kind of Sample is at the Rover's location
-- however you wish.
--
sample :: State Rover Sample
sample = undefined


-- Define a function that accepts a Direction and
-- takes a Sample before moving the Rover in that
-- Direction. The State computation should return
-- the Sample that was taken
--
grabAndGo :: Direction -> State Rover Sample
grabAndGo = undefined


-- Define a function that accepts a List of Directions
-- and returns State computation that will collect a
-- List of Samples from all the locations the Rover
-- passes through as it travels the course laid out.
--
mission :: [Direction] -> State Rover [Sample]
mission = undefined

