module Stack
( Stack (..)
, empty
, isEmpty
, cons
, head
, tail
, (++)
) where

  import Prelude hiding (head, tail, (++))

  data Stack a = Empty
               | Cons a (Stack a)
               deriving (Show, Read, Eq, Ord)

  cons :: a -> Stack a -> Stack a
  cons x xs = x `Cons` xs

  empty :: Stack a
  empty = Empty

  isEmpty :: Stack a -> Bool
  isEmpty Empty = True
  isEmpty _ = False

  head :: Stack a -> Maybe a
  head Empty = Nothing
  head (x `Cons` xs) = Just x

  tail :: Stack a -> Maybe (Stack a)
  tail Empty = Nothing
  tail (x `Cons` xs) = Just xs

  infixr 5 ++
  (++) :: Stack a -> Stack a -> Stack a
  Empty ++ ys = ys
  (x `Cons` xs) ++ ys = x `Cons` (xs ++ ys)

