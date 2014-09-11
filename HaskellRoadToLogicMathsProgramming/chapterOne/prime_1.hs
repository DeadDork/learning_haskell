-- One way to figure out prime numbers.

ld :: Int -> Int
ld n = ldf 2 n

ldf :: Int -> Int -> Int
ldf k n | divides k n = k
        | k^2 > n     = n
        | otherwise   = ldf (k + 1) n

divides :: Int -> Int -> Bool
divides k n = n `mod` k == 0

prime :: Int -> Bool
prime n | n < 1  = error "Not a positive integer."
        | n == 1 = False
        | otherwise = ld n == n
