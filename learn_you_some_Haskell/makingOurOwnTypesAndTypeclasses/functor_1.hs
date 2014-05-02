class Functor_ f where
    fmap_ :: (a -> b) -> f a -> f b

instance Functor_ [] where
    fmap_ = map
