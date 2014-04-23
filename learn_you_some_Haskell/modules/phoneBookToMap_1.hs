import qualified Data.Map as Map
phoneBookToMap :: (Ord k) => [(k,String)] -> Map.Map k String
phoneBookToMap = Map.fromListWith (\n1 n2 -> n1 ++ ", " ++ n2)
