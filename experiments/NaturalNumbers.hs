module NaturalNumbers ( Natural ) where

  newtype Natural = Natural Integer deriving (Eq, Ord)

  instance Show Natural where
    show (Natural n) = show n

  instance Integral Natural where
    Natural m `quotRem` Natural n =
      let quotN = Natural (m `quot` n)
          remN = Natural (m `rem` n)
       in (quotN, remN)
    toInteger (Natural n) = toInteger n

  instance Enum Natural where
    fromEnum = fromEnum . toInteger
    toEnum = fromInteger . toEnum

  instance Real Natural where
    toRational (Natural n) = toRational n

  instance Num Natural where
    Natural m + Natural n = Natural (m + n)
    Natural m * Natural n = Natural (m * n)
    Natural m - Natural n = Natural (m - n)
    abs (Natural n) = Natural n
    signum _ = 1
    fromInteger n
      | n < 1 = error "Natural numbers begin at 1."
      | otherwise = Natural n
    negate = error "Can't negate a natural number."
