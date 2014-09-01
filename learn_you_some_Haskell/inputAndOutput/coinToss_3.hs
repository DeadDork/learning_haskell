-- Playing with typeclasses.

-- Got it.

import System.Random

data Coin = Tails | Heads deriving (Bounded, Enum, Eq, Ord, Show)

instance Random Coin where
    randomR (a, b) g = case randomR (fromEnum a, fromEnum b) g of
        (x, g') -> (toEnum x, g')
    random g = randomR (minBound, maxBound) g

flip' :: IO Coin
flip' = do g <- newStdGen
           let (v, _) = random g :: (Coin, StdGen)
           return v
