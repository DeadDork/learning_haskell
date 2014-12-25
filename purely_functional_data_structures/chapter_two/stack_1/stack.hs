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
  update xs i y = do
    let update' Empty 0 _ = Empty
        update' (a `Cons` as) 0 b = b `Cons` as
        update' (a `Cons` as) n b = a `Cons` (update' as (n - 1) b)
     in do
       let length' Empty = 0
           length' (a `Cons` as) = 1 + length' as
        in do
          if length' xs <= i
             then Nothing
             else return $ update' xs i y
