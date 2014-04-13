cylinder :: (RealFloat a) => a -> a -> a
cylinder r h = sideArea + 2 * topArea
    where sideArea = 2 * pi * r * h
          topArea = 2 * pi * r ^ 2
