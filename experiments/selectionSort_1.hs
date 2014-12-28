module Sort
( selection
) where

  {--- Naive implementation
  selection :: (Ord a) => [a] -> [a]
  selection = selection' []
    where selection' xs [] = xs
          selection' xs (y:zs) = selection' (maximum' (y:zs) : xs) zs
          maximum [] = error "Empty list" -- To shut up the compiler warning
          maximum' (x:xs) = max' x xs
          max' x [] = x
          max' x (y:zs)
            | x > y = max' x zs
            | otherwise = max' y zs
  -}

  -- Cheating a bit
  selection :: (Ord a) => [a] -> [a]
  selection = selection' []
    where selection' xs [] = xs
          selection' xs (y:zs) = selection' (maximum (y:zs) : xs) zs
