import qualified Data.Map as Map

keys' :: Map.Map k v -> [k]
keys' = map fst . Map.toList

values' :: Map.Map k v -> [v]
values' = map snd . Map.toList
