-- Works!

-- N.B. Can be optimized by breaking up the range, e.g. 999 - 900, 899 - 800

import Data.Natural

main = putStrLn $ show $ largestPalindromicNumber 3

largestPalindromicNumber :: Natural -> (Natural, Natural, Natural)
largestPalindromicNumber 0 = error "Can't have zero length factors"
largestPalindromicNumber n = maximum [(x * y, x, y) | x <- range n,
                                                      y <- range n,
                                                      isPal $ x * y]
    where range a = [10^a - 1, 10^a - 2 .. 10^(a - 1)]
          isPal a = a == (read . reverse . show $ a :: Natural)
