-- Construct the word Gazump as a string in 4 different
-- ways and prove they are equal

gazump = "Gazump"
gazump' = ['G','a','z','u','m','p']
gazump'' = 'G':'a':'z':'u':'m':'p':[]
gazump''' = "Gaz" ++ "ump"

gazumpWorks = gazump == gazump' &&
              gazump' == gazump'' &&
              gazump'' == gazump'''

-- Write a function that totals top 3 numbers in a
-- list (assuming the list is sorted with highest first)

top3sum xs = sum (take 3 xs)

-- Write a function to extract a portion of a string
-- (a substring) based on position and length

substr pos len str = take len (drop pos str)

-- Write a function to tell if a list's length is > 4
-- (it should return a boolean)

longerThan4 xs = length xs > 4

-- Write a function like the one above *without* referring
-- to the list's length

longerThan4' xs = not (null (drop 4 xs))

-- Write safe versions of tail and init that return
-- empty list if the list is empty

safeTail xs = if null xs then [] else tail xs
safeInit xs = if null xs then [] else init xs

-- Write safe versions of head and last that take a
-- default value to return if the list is empty

safeHead ifNull xs = if null xs then ifNull else head xs
safeLast ifNull xs = if null xs then ifNull else last xs

-- write a function to tell if either the sum or product
-- of a list is in another list

sumOrProductIsIn needle haystack =
  (sum needle `elem` haystack) ||
  (product needle `elem` haystack)

-- write a function that reverses a section of a string
-- based on position and length. Use your substring function
-- from earlier to help.

reverseSection pos len str = take pos str ++
                             reverse (substr pos len str) ++
                             drop (pos + len) str

