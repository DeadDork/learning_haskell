fib :: (Integral a) => a -> a
fib n = case n of 0 -> 0
                  1 -> 1
                  n -> fib (n - 1) + fib (n - 2)
