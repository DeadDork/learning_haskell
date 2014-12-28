module Sort
( insertion
) where

  insertion :: (Ord a) => [a] -> [a]
  insertion = foldr insert []
    where insert x [] = [x]
          insert x (y:zs)
            | x > y = y : insert x zs
            | otherwise = x : y : zs
