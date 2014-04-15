sumOddSquares :: (Integral a) => a -> a
sumOddSquares m = sum (takeWhile (<m) (filter odd (map (^2) [1..])))
