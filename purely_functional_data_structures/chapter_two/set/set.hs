module Set
( Set
, empty
, fromList
, insert
, member
) where

  data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Eq, Read, Show)

  type Set = Tree

  empty :: Set a
  empty = Empty

  member :: (Ord a) => a -> Set a -> Bool
  member _ Empty = False
  member x (Node y left right)
     | x == y = True
     | x < y = member x left
     | x > y = member x right

  insert :: (Ord a) => a -> Set a -> Set a
  insert x Empty = Node x Empty Empty
  insert x (Node y left right)
     | x == y = Node y left right
     | x > y = Node y left (insert x right)
     | x < y = Node y (insert x left) right

  fromList :: (Ord a) => [a] -> Set a
  fromList = foldr insert Empty

  {- Naive implementation.
  -- N.B. very slow because of how ++ catenates in Haskell.
  toList :: (Ord a) => Set a -> [a]
  toList Empty = []
  toList (Node x left right)
    | left == Empty && right == Empty = [x]
    | otherwise = (toList left) ++ [x] ++ (toList right)
  -}

  -- Utilizes treeFoldr on cons, so cons efficiently from right to left.
  -- N.B. Given the path treeFoldr takes, the output list is sorted.
  toList :: (Ord a) => Set a -> [a]
  toList = treeFoldr (:) []

  treeFoldr :: (Ord a) => (a -> b -> b) -> b -> Set a -> b
  treeFoldr _ a Empty = a
  treeFoldr f a (Node x Empty Empty) = f x a
  treeFoldr f a (Node x Empty right) = f x $ treeFoldr f a right
  treeFoldr f a (Node x left right) = treeFoldr f (f x $ treeFoldr f a right) left
  treeFoldr f a (Node x left Empty) = f x $ treeFoldr f a left
