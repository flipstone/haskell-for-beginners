-- Implement a program to make change. Your
-- program should accept a list of numbers
-- on stdin. The first number indicates the
-- amount of money to change, the rest
-- indicate the denominations of coin to
-- make change into.
--
-- The program should print out a list of
-- coins in the denominations given that totals
-- up to the amount of money being changed.
-- If there is money left over (i.e. the money
-- cannot be divided evenly into the denominations
-- given), the program should print the list of
-- coins and a message indicating how much
-- was left unchanged.
--
import Data.List (sort, foldl', intercalate)

main = interact makeChange

data Coin = Coin Int deriving (Show, Eq, Ord)
data Unchanged = Unchanged Int deriving Show
data Change = Change Unchanged [Coin] deriving Show

readInt :: String -> Int
readInt = read

makeChange :: String -> String
makeChange s =
  let (total:denominations) = map readInt (words s)
      unchanged = Unchanged total
      coins = reverse $ sort $ map Coin denominations
      initial = Change unchanged []
  in showResult $ foldl' giveCoins initial coins

giveCoins :: Change -> Coin -> Change
giveCoins orig@(Change (Unchanged total) coins) coin@(Coin value)
  | value > total = orig
  | otherwise = let count = total `div` value
                    given = count * value
                in Change (Unchanged (total - given))
                          (coins ++ replicate count coin)

value :: Coin -> Int
value (Coin v) = v

showResult :: Change -> String
showResult (Change (Unchanged total) coins) =
  (intercalate "\n" $ map (show . value) coins) ++ "\n" ++
  if total > 0
  then "And " ++ show total ++ " unchanged!" ++ "\n"
  else ""


