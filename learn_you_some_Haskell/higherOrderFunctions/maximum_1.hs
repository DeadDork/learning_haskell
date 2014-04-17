maximum' :: (Ord a) => [a] -> a
maximum' = foldl1 (\ a x -> if x > a then x else a)
