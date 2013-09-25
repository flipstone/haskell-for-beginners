import Control.Monad.Writer

type Rover = (Int,Int)
data Direction = North | South | East | West deriving Show
type Path = [Direction]


-- Note: the text uses the data constructor Writer to
-- create trivial writer actions, but mtl-2.1.2 does
-- not export the data constructor. It instead exports
-- writer (lowercase 'w'), which has the same type
-- signature ((a,w) -> Writer w a)

-- Define a go action that will take a Direction
-- and a Rover and calculate the new Rover's position,
-- recording the Direction in a Writer so the Path
-- taken can be tracked.
--
go :: Direction -> Rover -> Writer Path Rover
go dir (x,y) = writer ((x',y'), [dir])
  where x' = x + dX dir
        y' = y + dY dir
        dY North = 1
        dY South = -1
        dY _ = 0
        dX East = 1
        dX West = -1
        dX _ = 0


-- Define a function to decide which Direction the
-- Rover will go based on its current position.
-- Decide which Direction to however you would like.
--
decide :: Rover -> Direction
decide (x,y)
  | x `mod` y == 0 = North
  | y `mod` x == 0 = East
  | x > y = West
  | otherwise = South


-- Using the go and decide functions, construct a
-- Writer action that will take a Rover and make
-- it move a step on autopilot
--
autopilot :: Rover -> Writer Path Rover
autopilot rover = go (decide rover) rover


-- Define a function that accepts a list of Rover
-- commands (Rover -> Writer Path Rover) and executes
-- them in sequence, starting with the Rover at (0,0).
--
-- The function should return the Rover and the Path
-- it took.
--
runRover :: [Rover -> Writer Path Rover] -> (Rover, Path)
runRover commands = runWriter $
  foldl (>>=) (writer ((0,0),[])) commands


-- Construct a Rover routine using a comination of
-- explicit 'go' instructions and 'autopilot' commands.
-- Run it in the Writer Monad and find out where the
-- Rover ends up starting from (0,0), and what Path it
-- took.
--
rover :: (Rover, Path)
rover = runRover [
    go North,
    autopilot,
    go East,
    autopilot, autopilot, autopilot,
    go West,
    autopilot, autopilot, autopilot
  ]

