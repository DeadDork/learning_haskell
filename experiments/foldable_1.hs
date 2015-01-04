import Data.Foldable as F
import Data.Monoid

data List a = Empty | a `Cons` List a

instance Monoid (List a) where
  mempty = Empty
  xs `mappend` zs =
    case xs of
         Empty -> zs
         x `Cons` ys -> x `Cons` (ys `mappend` zs)

instance Foldable List where
  foldMap _ Empty = mempty
  foldMap f (x `Cons` xs) = f x `mappend` foldMap f xs
