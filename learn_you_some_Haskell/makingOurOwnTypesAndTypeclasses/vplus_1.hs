data Vector a = Vector a a a deriving (Show)

vplus :: (Num a) => (Vector a) -> (Vector a) -> (Vector a)
(Vector a b c) `vplus` (Vector d e f) = Vector (a+d) (b+e) (c+f)
