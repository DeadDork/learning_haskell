-- Determines what's the smallest Int in a list.

mnmInt :: [Int] -> Int
mnmInt [] = error "Empty list"
mnmInt [x] = x
mnmInt (x:xs) = min x (mnmInt xs)
