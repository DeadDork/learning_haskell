data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

singleton :: (Ord a) => a -> Tree a
singleton x = Node x EmptyTree EmptyTree

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)
    | x == a = Node x left right
    | x < a  = Node a (treeInsert x left) right
    | x > a  = Node a left (treeInsert x right)

createTree :: (Ord a) => [a] -> Tree a
createTree xs = foldr treeInsert EmptyTree xs

searchTree :: (Ord a) => a -> Tree a -> Bool
searchTree x EmptyTree = False
searchTree x (Node a left right)
    | x == a = True
    | x < a  = searchTree x left
    | x > a  = searchTree x right
