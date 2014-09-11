-- Sort an Int list xs from smallest to largest.

removeFst :: [Int] -> Int -> [Int]
removeFst [] _ = []
removeFst (x:xs) m | m == x = xs
                   | otherwise = x : removeFst xs m

mnmInt :: [Int] -> Int
mnmInt [] = error "Empty list"
mnmInt [x] = x
mnmInt (x:xs) = min x (mnmInt xs)

srtInts :: [Int] -> [Int]
srtInts [] = []
srtInts xs = m : srtInts (removeFst xs m) where m = mnmInt xs
