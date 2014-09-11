-- Sorts a string in alphabetical order.

srtStr :: String -> String
srtStr [] = []
srtStr xs = a : srtStr (rmFst a xs) where a = mnm xs

rmFst :: (Eq a) => a -> [a] -> [a]
rmFst _ [] = []
rmFst c (x:xs) | x == c = xs
               | otherwise = x : rmFst c xs

mnm :: (Ord a) => [a] -> a
mnm [] = error "Empty list"
mnm [x] = x
mnm (x:xs) = x `min` (mnm xs)
