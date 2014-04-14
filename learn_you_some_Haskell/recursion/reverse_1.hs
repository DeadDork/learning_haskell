reverse' :: (Eq a) => [a] -> [a]
reverse' xs
    | xs == [] = []
reverse' (x:xs) = reverse' xs ++ [x]
