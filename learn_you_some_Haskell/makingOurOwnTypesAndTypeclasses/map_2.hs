import qualified Data.List as L
import qualified Data.Map as M

class Functor' f where
    fmap' :: (a -> b) -> f a -> f b

instance (Ord k) => Functor' (M.Map k) where
    fmap' f x =
        let oldList = M.toList x
            newList  = L.map (\(a,b) -> (a, f b)) oldList
        in M.fromList newList
