p :: (Integral a) => a -> Bool
p x = if x `mod` 10 == 0 then True else False
