import qualified Data.List as L
import qualified Data.Function as F
import qualified Data.Char as C
words' :: [Char] -> [[Char]]
words' = filter (not . any C.isSpace) . L.groupBy ((==) `F.on` C.isAlphaNum)
