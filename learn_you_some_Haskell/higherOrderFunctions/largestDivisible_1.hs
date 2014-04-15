largestDivisible :: (Integral a) => a -> a -> a
largestDivisible m d = head (filter p [m,(m-1)..])
    where p y = y `mod` d == 0
