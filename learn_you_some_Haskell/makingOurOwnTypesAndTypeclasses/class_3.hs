data Perhaps a = Nada | Algo a

instance (Eq a) => Eq (Perhaps a) where
    Algo x == Algo y = x == y
    Nada == Nada = True
    _ == _ = False
