import qualified Data.Map as Map
phoneBookToMap :: (Ord k) => [(k,v)] -> Map.Map k [v]
phoneBookToMap xs = Map.fromListWith (++) $ map (\(k,v) -> (k,[v])) xs
