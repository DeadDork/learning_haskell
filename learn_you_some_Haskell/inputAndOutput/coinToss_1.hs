import System.Random

data Coin = Heads | Tails deriving (Show, Enum, Bounded)
instance Random Coin where
    randomR (a,b) g =
        case randomR (fromEnum a, fromEnum b) g of
            (x, g') -> (toEnum x, g')
    random g = randomR (minBound, maxBound) g

coinToss :: Int -> StdGen -> [Coin]
coinToss tosses gen = take tosses $ randoms gen :: [Coin]
