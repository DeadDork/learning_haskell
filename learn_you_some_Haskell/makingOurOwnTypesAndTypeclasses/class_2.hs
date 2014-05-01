class Eq_ a where
    (===) :: a -> a -> Bool
    (/==) :: a -> a -> Bool
    x === y = not (x /== y)
    x /== y = not (x === y)

data Perhaps a = Nada | Algo a

instance (Eq_ a) => Eq_ (Perhaps a) where
    Algo x === Algo y = x === y
    Nada === Nada = True
    _ === _ = False 
