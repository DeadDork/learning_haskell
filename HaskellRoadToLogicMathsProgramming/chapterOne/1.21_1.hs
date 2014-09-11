-- Given a list of lists, sums the lengths of the sublists.

-- N.B. I'm totally cheating using a fold, but come on...

sumLengths :: [[a]] -> Int
sumLengths xs = foldr (+) 0 $ map length xs
