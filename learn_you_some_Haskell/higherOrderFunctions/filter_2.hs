filter' :: (a -> Bool) -> [a] -> [a]
filter' p = foldr (\ x a -> if p x then x : a else a) []
