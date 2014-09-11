-- Given a Int list xs and an Int m, removes the first occurence of m in xs.

removeFst :: [Int] -> Int -> [Int]
removeFst [] _ = []
removeFst (x:xs) m | m == x = removeFst xs m
                   | otherwise = x : removeFst xs m
