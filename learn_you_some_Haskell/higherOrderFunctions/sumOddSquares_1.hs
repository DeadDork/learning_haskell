sumOddSquares :: (Integral a) => a -> a
sumOddSquares m = sum (takeWhile (<m) [x^2 | x <- [1..], odd (x^2)])
