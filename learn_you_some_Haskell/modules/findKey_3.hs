findKey :: (Eq k) => k -> [(k,v)] -> Maybe v
findKey key [] = Nothing
findKey key x:xs = if key == x
                      then Just x
                      else findKey key xs
