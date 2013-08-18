import qualified Data.Map as Map
import System.Random

type Distribution = Map.Map Int Int

-- Define a function to simulate a roll of a
-- single 6 sided die by "rolling" it n times
-- and returning how many times each result appeared.
--
dieResults :: (RandomGen g) => g -> Int -> Distribution
dieResults g n = Map.fromListWith (+) tallies
  where results = take n $ randomRs (1,6) g
        tallies = map (\r -> (r,1)) results

-- Define a function to simulate a roll of a
-- n 6 sided dice once, adding the results
-- together, and returning a new random generator.
--
--
rollDice :: (RandomGen g) => g -> Int -> (Int, g)
rollDice g n | n <= 0 = (0, g)
rollDice g n =
  let (subtotal, g') = rollDice g (n - 1)
      (roll, g'') = randomR (1,6) g'
  in (subtotal + roll, g'')

-- Define a function to simulate a any number
-- of rolls of n 6 sided by returning an infinite
-- list of roll results.
--
-- (use your rollDice function from above)
--
diceRolls :: (RandomGen g) => g -> Int -> [Int]
diceRolls g n =
  let (roll, g') = rollDice g n
  in roll : diceRolls g' n

-- Define a function to simulate a roll of a
-- n 6 sided die by "rolling" it m times
-- and returning how many times each result appeared.
--
-- (use your diceRolls function from above)
--
diceResults :: (RandomGen g) => g -> Int -> Int -> Distribution
diceResults g n m = Map.fromListWith (+) tallies
  where results = take m $ diceRolls g n
        tallies = map (\r -> (r,1)) results


-- Define a function that accepts a number of dice
-- to roll and uses your diceResults function to build
-- an IO action that will simulate 1000 dice rolls and
-- print the results.
--
-- Make sure that the action runs a new simulation each
-- time it is run!
--
simulateDice :: Int -> IO ()
simulateDice n = do
  g <- newStdGen
  let results = diceResults g n 1000
  print results

