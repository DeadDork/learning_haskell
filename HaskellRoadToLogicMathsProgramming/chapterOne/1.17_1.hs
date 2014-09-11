-- Determine if a list is a sub-list of a second list.

subLst :: (Eq a) => [a] -> [a] -> Bool
subLst [] _ = True
subLst _ [] = False
subLst (x:xs) (y:ys) | x /= y = True && subLst (x:xs) ys
                     | otherwise = True && subLst xs ys
