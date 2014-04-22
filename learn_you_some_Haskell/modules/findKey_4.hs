findKey :: (Eq k) => k -> [(k,v)] -> Maybe v
findKey key = foldr (\(k,v) a -> if key == k then Just v else a) Nothing
