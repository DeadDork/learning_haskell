replicate' :: (Integral a, Show b) => a -> b -> [b]
replicate' n x
    | n <= 0    = []
    | otherwise = x:replicate' (n - 1) x
