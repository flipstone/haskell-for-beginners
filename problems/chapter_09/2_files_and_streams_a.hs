-- Note: GHCI disables buffering on stdin, which produces
-- unexpected (though correct) results for getContents and
-- friends. You can test your answers to the problems below
-- by changing main below to be whichever action you'd like
-- to run and using the runhaskell command at the shell prompt:
--
--   runhaskell <path to file>
--
main = yakkityYak

-- Define an action that uses getContents to read
-- lines from stdin and prints out the number of
-- yaks on each line. Verify that your action
-- prints out lines as they are typed in.
--
yakkityYak :: IO ()
yakkityYak = undefined

-- Redefine the action above using interact


-- Define an action that reads lines from stdin
-- and after each line prints the total number of
-- characters read thus far.
--

-- BONUS: Try running these actions from GHCI and explain
-- what happens.

