module NaturalNumbers2
  ( Natural
  ) where

  data Natural = One
               | Succ Natural deriving (Eq, Ord)

  instance Integral Natural where
    m `quotRem` n = (quotN, remN)
      where quotN = fromInteger $ toInteger m `quot` toInteger n
            remN = fromInteger $ toInteger m `rem` toInteger n
    toInteger = toInteger . (1 +) . fromEnum

  -- Zero indexed
  instance Enum Natural where
    fromEnum n
      | n == One = 0
      | otherwise = 1 + fromEnum (n - One)
    toEnum = fromInteger . toInteger

  instance Real Natural where
    toRational = fromInteger . toInteger

  instance Num Natural where
    m + n
      | n == One = Succ m
      | otherwise = Succ m + (n - One)
    m * n
      | n == One = m
      | otherwise = m + (m * (n - One))
    m - n
      | m == One = naturalError
      | n == One = f m
      | otherwise = m - (n - One)
        where f (Succ l) = l
              f _ = One
    abs n = n
    signum _ = 1
    fromInteger n
      | n < 1 = naturalError
      | n == 1 = One
      | otherwise = Succ (fromInteger (n - 1))
    negate _ = naturalError

  instance Show Natural where
    show n
      | n == One = "One"
      | n == Succ One = "Succ One"
      | otherwise = "Succ (" ++ show (n - 1) ++ ")"

  naturalError :: a
  naturalError = error "A natural number is here defined as an integer greater than 1."
