module AdventureGame.UI
  (
    Output(..),
    Action(..),
    Engine,
    Loader,
    run
  ) where

import Control.Monad (liftM)

data Output = Print String | Done
data Action a = Action Output a
type Engine a = String -> a -> Action a
type Loader a = String -> Maybe a

run :: Loader (Action a) -> Engine a -> String -> IO ()
run load engine file = do
  world <- runLoader load file
  case world of
    (Just action) -> runEngine engine action
    Nothing -> putStrLn "Unable to load world"

runLoader :: Loader a -> String -> IO (Maybe a)
runLoader load file = do
  worldData <- readFile file
  return (load worldData)

runEngine :: Engine a -> Action a -> IO ()
runEngine engine action = do
  result <- runAction engine action
  case result of
    (Just action') -> runEngine engine action'
    Nothing -> return ()

runAction :: Engine a -> Action a -> IO (Maybe (Action a))
runAction _ (Action Done _) = return Nothing
runAction engine (Action (Print s) game) = do
  mapM_ putStrLn (lines s)
  liftM Just (prompt engine game)

prompt :: Engine a -> a -> IO (Action a)
prompt engine game = do
  putStr "> "
  input <- getLine
  return (engine input game)


