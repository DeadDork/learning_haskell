-- Explores the potential of () as a no op function.

-- Conclusion: doesn't work.

import Data.Natural

f :: Natural -> [Natural]
f n | n == 0 = []
    | even n = () -- Doesn't typecheck
    | otherwise = n : f (n - 1)
