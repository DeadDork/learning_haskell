-- Came across record syntax assignment that resembled basic data type
-- assignment.

-- Conclusion: can make record syntax assignment without have to specific
-- the record name, order is sufficient.

newtype Pair b a = Pair { getPair :: (a,b) } deriving Show

data Car = Car String String Int deriving Show

data Car' = Car' { company :: String
                 , model :: String
                 , year :: Int
                 } deriving Show

-- E.G.
-- ghci> let c = Car "Ford" "Stang" 1963
-- ghci> let c' = Car' "Ford" "Stang" 1963
-- ghci> c
-- Car "Ford" "Stang" 1963
-- ghci> c'
-- Car' {company = "Ford", model = "Stang", year = 1963}
-- ghci> Pair (1,2)
-- Pair {getPair = (1,2)}
