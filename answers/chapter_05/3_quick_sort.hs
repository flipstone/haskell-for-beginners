-- Implement a bubble sort:
--   http://en.wikipedia.org/wiki/Bubble_sort
--
-- HINT: try using two functions, inOrder and bubbleSort

inOrder :: (Ord a) => [a] -> Bool
inOrder [] = True
inOrder [x] = True
inOrder (x1:x2:xs) | x2 < x1 = False
                   | otherwise = inOrder (x2:xs)

bubbleSort :: (Ord a) => [a] -> [a]
bubbleSort xs | inOrder xs = xs
bubbleSort [] = []
bubbleSort [x] = [x]
bubbleSort (x1:x2:xs) | x2 < x1 = bubbleSort (x2:bubbleSort(x1:xs))
                      | otherwise = bubbleSort (x1:bubbleSort(x2:xs))

