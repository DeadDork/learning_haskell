-- Explores whitespacing of where clause.

-- The where clause is riteous.

import Data.Natural

nextPalindrome' :: Natural -> Natural -> Natural -> Natural
nextPalindrome' n l r
    | r - l <= 1 && ll == rr = n
    | ll == rr               = nextPalindrome' n (l + 1) (r - 1)
    | otherwise              = nextPalindrome' (n - 10^l) l r 
    where ll = s !! (fromIntegral l :: Int)
          rr = s !! (fromIntegral r :: Int)
          s = show n
