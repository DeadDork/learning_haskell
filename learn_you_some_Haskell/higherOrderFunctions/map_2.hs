map' :: (a -> b) -> [a] -> [b]
map' f = foldr (\ x a -> f x : a) []
