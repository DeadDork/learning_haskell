module Stack
( Stack (..)
, empty
, isEmpty
, cons
, head
, tail
, (++)
, update
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

  head :: Stack a -> a
  head Empty = error "Empty stack"
  head (x `Cons` _) = x

  tail :: Stack a -> Stack a
  tail Empty = error "Empty stack"
  tail (_ `Cons` xs) = xs

  infixr 5 ++
  (++) :: Stack a -> Stack a -> Stack a
  Empty ++ ys = ys
  (x `Cons` xs) ++ ys = x `Cons` (xs ++ ys)

  update :: Stack a -> Int -> a -> Stack a
  update Empty _ _ = error "Empty stack"
  update _ i _ | i < 0 = error "Negative stack index"
  update (_ `Cons` xs) 0 y = y `Cons` xs
  update (x `Cons` xs) i y = x `Cons` update xs (i - 1) y
