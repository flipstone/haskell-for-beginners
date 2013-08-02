-- Define an action below that will print a hello world message.
-- Execute the program in GHCI.

import Control.Monad (when)

helloWorld = putStrLn "hello, world"

-- Add a type declaration for helloWorld.
helloWorld :: IO ()

-- Write, compile and run a hello world program from scratch
-- in another file.
--


-- Define a function that takes a secret string and returns
-- an action that will ask the user to guess the secret.
-- Tell the user whether they guessed the secret correctly.
-- Be sure to include a type declaration.
--
guessTheSecret :: String -> IO ()
guessTheSecret secret = do
  putStrLn "I have a secret. Can you guess what it is?"
  guess <- getLine
  if guess == secret
    then putStrLn "You got it!"
    else putStrLn "Nope!"


-- Define a funtion that prompts the user with a given string
-- and reads the users response. It should return the users
-- response, but ensure there is only one space between words
-- (and none on the beginning or end). Include a type declaration!
--
prompt :: String -> IO String
prompt text = do
  putStrLn text
  response <- getLine
  return . unwords . words $ response


-- Define an action that will ask the user 3 questions before they
-- may pass over the bridge. The first two questions always ask for
-- their name and quest. Normally the last question asks their
-- favorite color, but knights named Robin are asked what the
-- capital of Assyria is, and kings name Arthur are queried about the
-- speed of unbaggaged airborn fowl.
--
-- Judge the answers however you see fit, and tell the user whether
-- they are allowed to cross the bridge or are cast into the Gorge
-- of Eternal Peril. Use the prompt function you just wrote, and
-- write any more functions for yourself to use as you see fit.
--
challenge :: String -> String ->  IO Bool
challenge promptText expectedAnswer = do
  answer <- prompt promptText

  when (answer /= expectedAnswer) $ do
    putStrLn "You are cast into the Gorge!"

  return $ answer == expectedAnswer

robinsChallenge = challenge "What is the capital of Assyria!?"
                            "Nineveh"

arthursChallenge = challenge "What is the air-speed velocity of an unladen swallow?"
                             "What do you mean? An African or European swallow?"

genericChallenge = challenge "What is your favorite color?"
                             "Blue"

bridgeOfDeath = do
  name <- prompt "What is your name?"
  questSuccess <- challenge "What is your quest?"
                            "To seek the Holy Grail"

  when questSuccess $ do
    finalSuccess <- case name of
                      "Robin" -> robinsChallenge
                      "Arthur" -> arthursChallenge
                      _ -> genericChallenge

    when finalSuccess (putStrLn "Right. Off you go.")


