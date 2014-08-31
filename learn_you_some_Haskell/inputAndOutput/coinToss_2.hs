-- Trying to understand this.

-- OK, almost figured this out. Going to try one more time.

import System.Random

data Coin = Heads | Tails deriving (Bounded, Enum, Eq, Ord, Show)

instance Random Coin where
    randomR (a, b) g = case randomR (fromEnum a, fromEnum b) g of
        (x, g') -> (toEnum x, g')
    random g = randomR (minBound, maxBound) g

flip' :: StdGen -> Coin
flip' g = v
    where (v, _) = random g :: (Coin, StdGen)
