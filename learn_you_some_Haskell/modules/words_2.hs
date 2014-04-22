-- Makes more sense to return "Hey, you!" as ["Hey", "you"] than ["Hey,", "you!"]
import qualified Data.Char as C
import qualified Data.Function as F
import qualified Data.List as L
words' :: [Char] -> [[Char]]
words' = filter (any C.isAlphaNum) . L.groupBy ((==) `F.on` C.isAlphaNum)
