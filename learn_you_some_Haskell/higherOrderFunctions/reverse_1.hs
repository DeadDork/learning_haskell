reverse' :: [a] -> [a]
reverse' = foldl (\ a x -> x : a) []
