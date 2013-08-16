-- Implement a program that processes input based on a command
-- specified as an argument on the command line. The mirror
-- command should reverse each line in the input. The reverseLines
-- command should reverse the order of lines in the input, without
-- changing the lines themselves.
--
-- If a second argument is given, it should be used as a filename
-- to read input from. Otherwise input should be read from stdin.
--
-- Btw, stdin :: Handle in System.IO ;)
--
import System.Environment
import System.IO

main = do
  args <- getArgs
  case args of
    [] -> putStrLn "Please specify a command"
    [command] -> runCommand command stdin
    (command:file:_) -> withFile file ReadMode $ runCommand command

runCommand :: String -> Handle -> IO ()
runCommand command handle = do
  case lookup command commands of
    Just action -> action handle
    otherwise -> do putStr "Valid commands are: "
                    print $ map fst commands
                    putStr "\n"

commands :: [(String, Handle -> IO())]
commands = [
    ("mirror", mirror),
    ("reverseLines", reverseLines)
  ]

mirror :: Handle -> IO ()
mirror = readingHandle $ unlines . map reverse . lines

reverseLines :: Handle -> IO ()
reverseLines = readingHandle $ unlines . reverse . lines

readingHandle :: (String -> String) -> Handle -> IO ()
readingHandle f h = do
  contents <- hGetContents h
  putStr $ f contents

