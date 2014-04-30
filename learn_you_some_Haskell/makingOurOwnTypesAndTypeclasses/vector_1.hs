data Vector a = Vector a a a deriving (Show)

vplus :: (Num a) => Vector a -> Vector a -> Vector a
(Vector a b c) `vplus` (Vector z y x) = Vector (a+z) (b+y) (c+x)

vectMult :: (Num a) => Vector a -> a -> Vector a
(Vector a b c) `vectMult` m = Vector (a*m) (b*m) (c*m)

scalarMult :: (Num a) => Vector a -> Vector a -> a
(Vector a b c) `scalarMult` (Vector z y x) = a*z + b*y + c*x
