oddSquareSum :: (Integral a) => a -> a
oddSquareSum n =
    let oddSquares = filter odd $ map (^2) [1..]
        belowLimit = takeWhile (<n) oddSquares
    in sum belowLimit
