module Set
( Set
, empty
, insert
, member
) where

  data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Eq, Read, Show)

  type Set = Tree

  empty :: Set a
  empty = Empty

  member :: (Ord a) => Set a -> a -> Bool
  member Empty _ = False
  member (Node x left right) y | y == x = True
                               | y < x = member left y
                               | otherwise = member right y

  insert :: (Ord a) => Set a -> a -> Set a
  insert Empty y = Node y Empty Empty
  insert (Node x left right) y | x == y = Node x left right
                               | x > y = insert left y
                               | x < y = insert right y

  fromList :: [a] -> Set a
