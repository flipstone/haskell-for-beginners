import Control.Monad.State

type Rover = (Int,Int)
data Direction = North | South | East | West
data Sample = Dust | Rock | Life deriving Show

-- Define a go function that accepts a Direction
-- and returns a State computation to move a Rover
-- (the State) in the Direction requested.
--
go :: Direction -> State Rover ()
go dir = do
    (x,y) <- get
    put (x + dX, y + dY)

  where dY = case dir of
              North -> 1
              South -> -1
              otherwise -> 0

        dX = case dir of
              East -> 1
              West -> -1
              otherwise -> 0


-- Define a sample action that takes a scientific
-- Sample at the Rover's current location. You may
-- decide what kind of Sample is at the Rover's location
-- however you wish.
--
sample :: State Rover Sample
sample = do
  (x,y) <- get
  return $ if (x + 2) `mod` 3 == y `mod` 7
           then Life
           else if y == x + 5
                then Rock
                else Dust


-- Define a function that accepts a Direction and
-- takes a Sample before moving the Rover in that
-- Direction. The State computation should return
-- the Sample that was taken
--
grabAndGo :: Direction -> State Rover Sample
grabAndGo direction = do
  grabbed <- sample
  go direction
  return grabbed


-- Define a function that accepts a List of Directions
-- and returns State computation that will collect a
-- List of Samples from all the locations the Rover
-- passes through as it travels the course laid out.
--
mission :: [Direction] -> State Rover [Sample]
mission [] = return []
mission (dir:dirs) = do
  grabbed <- grabAndGo dir
  rest <- mission dirs
  return (grabbed:rest)

