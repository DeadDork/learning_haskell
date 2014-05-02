import qualified Data.Map as M

class Functor' f where
    fmap' :: (a -> b) -> f a -> f b

instance (Ord k) => Functor' (M.Map k) where
    fmap' = M.map

-- Testing:
-- ghci> let x = M.fromList [('a',1), ('b',2), ('c',3)]
-- ghci> fmap' (*3) x
-- fromList [('a',3),('b',6),('c',9)]
