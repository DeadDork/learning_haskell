-- This is a weird way to do `reverse`.
reverse' :: [a] -> [a]
reverse' = foldl (flip (:)) []
