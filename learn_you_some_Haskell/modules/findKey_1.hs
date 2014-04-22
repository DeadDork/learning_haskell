findKey :: (Eq a) => a -> [(a,b)] -> b
findKey key = snd . head . filter (\(k,v) -> k == key)
