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
moveState = undefined

-- Define a function that will look at the Rover's current
-- location in the world to see if there is anything there.
--
lookState :: RoverState -> Maybe Sample
lookState = undefined

-- Define a function that will add a sample to the Rover's
-- storage.
--
storeState :: Sample -> RoverState -> RoverState
storeState = undefined

-- Define a function that will retrieve the Rover's Sample set.
--
stateSamples :: RoverState -> [Sample]
stateSamples = undefined

-- The type below will define how we operate a Rover. Given the
-- current state of a rover we can produce a new state, along with
-- some output.
--
newtype Rover a = Rover { runRover :: RoverState -> (a, RoverState) }

-- Use moveState from above to define a Rover operation to move
-- a Rover. This operation doesn't produce any output.
--
move :: (Int,Int) -> Rover ()
move = undefined

-- Define north, south, east, and west operation that move the Rover
-- by one in the given direction.
--
north, south, east, west :: Rover ()
north = undefined
south = undefined
east = undefined
west = undefined

-- Use lookState from above to define a Rover operation that will
-- look at the Rover's current position and return what it finds as
-- the output of the operation.
--
look :: Rover (Maybe Sample)
look = undefined

-- Use storeState from above to define a Rover operation that will
-- store a Sample in the Rover's storage area.
--
store :: Sample -> Rover ()
store = undefined

-- Use stateSamples from above to define a Rover operation that will
-- output the current samples stored in the Rover.
--
samples :: Rover [Sample]
samples = undefined

-- It would be nice to be able to combine the operations we've just
-- define in a nice way to carry the state of the Rover from one
-- operation to the next. Define a Monad instance for Rover to do
-- just that!
--
instance Monad Rover where
  return = undefined
  (>>=) = undefined

-- Use the Rover Monad to define an operation using look and store
-- to take a sample at the Rover's current location and store it.
-- If Nothing is found, then don't store anything.
--
takeSample :: Rover ()
takeSample = undefined

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
execRover = undefined

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

