import qualified Data.List as L
countGroups :: (Ord a) => [a] -> [(a, Int)]
countGroups xs = map (\ a@(x:xs) -> (x, length a)) . L.group . L.sort $ xs
