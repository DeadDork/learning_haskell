-- Plays with the `deriving` keyword.

-- Conclusion: some type classes are derivable, others are not. Random
-- is not such a class.

import System.Random

data Coin = Tails | Heads deriving (Bounded, Enum, Eq, Ord, Show, Random)

-- E.G.
-- ghci> :l coinToss_4
-- [1 of 1] Compiling Main             ( coinToss_4.hs, interpreted )
--
-- coinToss_4.hs:5:67:
--     Can't make a derived instance of `Random Coin':
--           `Random' is not a derivable class
--               In the data declaration for `Coin'
--               Failed, modules loaded: none.
