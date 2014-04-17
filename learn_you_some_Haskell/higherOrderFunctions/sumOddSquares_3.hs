oddSquareSum :: Integral a => a -> a
oddSquareSum n = sum . takeWhile (<n) . filter odd . map (^2) $ [1..]
