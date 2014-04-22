-- Wanted to do findKey_4 again to make sure that I understand it
-- I gots dis
findKey :: (Eq k) => k -> [(k,v)] -> Maybe v
findKey key = foldr (\(k,v) acc -> if k == key then Just v else acc) Nothing
