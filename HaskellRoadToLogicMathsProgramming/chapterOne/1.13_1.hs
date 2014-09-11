-- Counts the occurences of a Char in String.

count :: [Char] -> Char -> Int
count [] _ = 0
count (x:xs) c | c == x = 1 + count xs c
               | otherwise = count xs c
