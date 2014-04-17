elem' :: (Eq a) => a -> [a] -> Bool
elem' x = foldl (\ a y -> if x == y then True else a) False
