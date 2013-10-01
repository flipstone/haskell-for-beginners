-- We're going to build a Monad that keeps track of a
-- Rovers position in a world, allowing us to move it
-- about and take samples. First we need a few data
-- types to get us started
--
type Position = (Int,Int)
type World = [(Position, Sample)]
data Sample = Soil | Water | Life | Rock deriving Show

-- The state of a Rover consists of its current position,
-- any samples it has stored, and the world about which it
-- is roving.
--
data RoverState = RoverState Position [Sample] World deriving Show

-- Define a function that will move a Rover specified distance
-- in the x and y directions.
--
moveState :: (Int, Int) -> RoverState -> RoverState
moveState (dX, dY) (RoverState (x,y) samples world) =
  RoverState (x+dX, y+dY) samples world

-- Define a function that will look at the Rover's current
-- location in the world to see if there is anything there.
--
lookState :: RoverState -> Maybe Sample
lookState (RoverState pos samples world) = lookup pos world

-- Define a function that will add a sample to the Rover's
-- storage.
--
storeState :: Sample -> RoverState -> RoverState
storeState sample (RoverState pos samples world) =
  RoverState pos (sample:samples) world

-- Define a function that will retrieve the Rover's Sample set.
--
stateSamples :: RoverState -> [Sample]
stateSamples (RoverState _ samples _) = samples

-- The type below will define how we operate a Rover. Given the
-- current state of a rover we can produce a new state, along with
-- some output.
--
newtype Rover a = Rover { runRover :: RoverState -> (a, RoverState) }

-- Use moveState from above to define a Rover operation to move
-- a Rover. This operation doesn't produce any output.
--
move :: (Int,Int) -> Rover ()
move d = Rover $ \rs -> ((), moveState d rs)

-- Define north, south, east, and west operation that move the Rover
-- by one in the given direction.
--
north, south, east, west :: Rover ()
north = move (0,1)
south = move (0,-1)
east = move (1,0)
west = move (-1,0)

-- Use lookState from above to define a Rover operation that will
-- look at the Rover's current position and return what it finds as
-- the output of the operation.
--
look :: Rover (Maybe Sample)
look = Rover $ \rs -> (lookState rs, rs)

-- Use storeState from above to define a Rover operation that will
-- store a Sample in the Rover's storage area.
--
store :: Sample -> Rover ()
store sample = Rover $ \rs -> ((), storeState sample rs)

-- Use stateSamples from above to define a Rover operation that will
-- output the current samples stored in the Rover.
--
samples :: Rover [Sample]
samples = Rover $ \rs -> (stateSamples rs, rs)

-- It would be nice to be able to combine the operations we've just
-- define in a nice way to carry the state of the Rover from one
-- operation to the next. Define a Monad instance for Rover to do
-- just that!
--
instance Monad Rover where
  return a = Rover (\s -> (a,s))
  (Rover f) >>= g = Rover $ \s -> let (a, newState) = f s
                            in  runRover (g a) newState

-- Use the Rover Monad to define an operation using look and store
-- to take a sample at the Rover's current location and store it.
-- If Nothing is found, then don't store anything.
--
takeSample :: Rover ()
takeSample = do
  sight <- look
  case sight of
    Just sample -> store sample
    otherwise -> return ()

-- Here is a world for your Rover to run around in!
world = [ ((x,y), w x y) | x <- [0..10], y <- [0..10] ]
  where w x y | abs x == abs y = Life
              | x > y = Water
              | x == y = Soil
              | otherwise = Rock

-- And here is a beginning Rover state
start = RoverState (5,5) [] world

-- Define a function that will use the start state
-- above and will run a Rover operation, returning
-- its output.
--
execRover :: Rover a -> a
execRover rover = fst (runRover rover start)

-- Here's some Rover instructions that will produce
-- some Samples from the World's surface. Try running
-- it and see what you get.
--
roverInstructions :: Rover [Sample]
roverInstructions = do
  takeSample
  north
  north
  takeSample
  east
  takeSample
  east
  south
  takeSample
  south
  takeSample
  samples

