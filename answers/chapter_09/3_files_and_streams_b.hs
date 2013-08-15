import System.IO

-- Define a function that accepts a filename
-- and returns an action that will read the file
-- and print out each line reversed. Use `openFile`
-- to accomplish this.
--
-- You can use "samples/mirror.txt" to test your action.

mirror :: String -> IO ()
mirror filename = do
  handle <- openFile filename ReadMode
  contents <- hGetContents handle
  putStr . unlines . map reverse . lines $ contents
  hClose handle

-- Define another function like the one above, but
-- use `withFile`
--
mirror' :: String -> IO ()
mirror' filename = withFile filename ReadMode $ \handle -> do
  contents <- hGetContents handle
  putStr . unlines . map reverse . lines $ contents

-- Define yet another function like the one above, but
-- use `readFile`
--
mirror'' :: String -> IO ()
mirror'' filename = do
  contents <- readFile filename
  putStr . unlines . map reverse . lines $ contents

-- Define a function that accepts *2* filenames and
-- returns an action that will read the contents of the
-- first file, reverse each line, and write it to the second
-- file
--
mirror2 :: String -> String -> IO ()
mirror2 source dest = do
  contents <- readFile source
  writeFile dest . unlines . map reverse . lines $ contents
