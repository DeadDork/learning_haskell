module CaseTest ( mult ) where
  mult :: Int -> Int -> Int
  mult x y = mult' x y
    where mult' m n = case (m,n) of
                           (a,b) | a == 0 || b == 0 -> 0
                           (_,b) | b < -1        -> mult' (m + x) (n + 1)
                           (_,-1)                -> -m
                           (_,1)                 -> m
                           (_,b) | b > 1         -> mult' (m + x) (n - 1)
