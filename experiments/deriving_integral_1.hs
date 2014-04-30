-- http://www.haskell.org/ghc/docs/latest/html/users_guide/deriving.html#deriving-typeable
-- lists all the derivable classes, which don't include Num
data Number a = Number a deriving (Num)
