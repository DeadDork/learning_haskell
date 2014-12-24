module Stack
( Stack (..)
, empty
, isEmpty
, cons
, head
, tail
, (++)
, update
, Natural
) where

  import Prelude hiding (head, tail, (++))
  import Data.Natural

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

  update :: Stack a -> Natural -> a -> Maybe (Stack a)
  update Empty _ _ = Nothing
  update (x `Cons` xs) 0 y = Just (y `Cons` xs)
  update (x `Cons` xs) i y = Just (x `Cons` (update xs (i - 1) y))
