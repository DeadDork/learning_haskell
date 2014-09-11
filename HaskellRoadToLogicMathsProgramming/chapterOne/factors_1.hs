-- Prime factorization.

factors :: (Integral a) => a -> [a]
factors n | n < 1 = error "Number less than 1"
          | n == 1 = []
          | otherwise = p : factors (n `div` p) where p = ld n

ld :: (Integral a) => a -> a
ld n = ldf 2 n

ldf :: (Integral a) => a -> a -> a
ldf k n | k `divides` n = k
        | k^2 > n = n
        | otherwise = ldf (k + 1) n

divides :: (Integral a) => a -> a -> Bool
divides k n = n `mod` k == 0
