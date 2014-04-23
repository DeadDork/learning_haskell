-- Had a bit of trouble wrapping my mind around phoneBookToMap, so doing it
-- from memory
import qualified Data.Map as Map
phoneBookToMap :: (Ord k) => [(k,v)] -> Map.Map k [v]
phoneBookToMap xs = Map.fromListWith (++) $ map (\(k,v) -> (k,[v])) xs
