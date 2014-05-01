class Eq_ a where
    (===) :: a -> a -> Bool
    (/==) :: a -> a -> Bool
    x === y = not (x /== y)
    x /== y = not (x === y)

class Show_ a where
    show_ :: a -> String

data Traffic = Red | Yellow | Green

instance Eq_ Traffic where
    Red === Red       = True
    Yellow === Yellow = True
    Green === Green   = True
    _ === _           = False

instance Show_ Traffic where
    show_ Red    = "Red"
    show_ Yellow = "Yellow"
    show_ Green  = "Green"
