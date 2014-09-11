-- Given a list of lists, returns a list of the respective lengths of the
-- sublists.

lengths :: [[a]] -> [Int]
lengths xs = map length xs
