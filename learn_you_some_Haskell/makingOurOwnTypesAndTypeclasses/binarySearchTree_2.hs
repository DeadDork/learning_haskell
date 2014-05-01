data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

singleton :: (Ord a) => a -> Tree a
singleton x = Node x EmptyTree EmptyTree

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node y left right)
    | x == y = Node x left right
    | x < y  = Node y (treeInsert x left) right
    | x > y  = Node y left (treeInsert x right)

createTree :: (Ord a) => [a] -> Tree a
createTree xs = foldr treeInsert EmptyTree xs

searchTree :: (Ord a) => a -> Tree a -> Bool
searchTree x EmptyTree = False
searchTree x (Node y left right)
    | x == y = True
    | x < y  = searchTree x left
    | x > y  = searchTree x right
