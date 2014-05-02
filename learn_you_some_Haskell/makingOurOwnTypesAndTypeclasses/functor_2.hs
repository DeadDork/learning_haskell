class Functor_ f where
    fmap_ :: (a -> b) -> f a -> f b

instance Functor_ Maybe where
    fmap_ f (Just x) = Just (f x)
    fmap_ f Nothing = Nothing

-- Test:
-- ghci> fmap_ (*3) (Just 3)
-- Just 9
