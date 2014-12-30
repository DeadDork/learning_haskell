module Sort
( fromList
-- , heapSort -- Currently making my head explode (and not in a good way)
-- , insert -- Hard to do this without an array to index
, lengthH
, toList
) where

  import qualified Data.Vector.Unboxed as U
  import qualified Data.Vector.Unboxed.Mutable as M

  type Index = Int

  data Heap a = Empty | Node Index a (Heap a) (Heap a) deriving (Eq, Read, Show)

  instance (Eq a, Ord a) => Ord (Heap a) where
    compare Empty Empty = EQ
    compare _ Empty = GT
    compare Empty _ = LT
    compare (Node _ vl _ _) (Node _ vr _ _) = compare vl vr

  fromList :: (Ord a, U.Unbox a) => [a] -> Heap a
  fromList [] = Empty
  fromList xs = fromList' 0 $ U.fromList xs

  fromList' :: (Ord a, U.Unbox a) => Index -> U.Vector a -> Heap a
  fromList' ip vx = heapify $
    case vx U.!? ip of
         Nothing -> Empty
         Just vp -> Node ip vp (fromList' il vx) (fromList' ir vx)
           where il = 2 * ip + 1
                 ir = 2 * ip + 2

  heapify :: (Ord a) => Heap a -> Heap a
  heapify Empty = Empty
  heapify p@(Node i v l r)
    | p < l = heapify $ leftSwap p
    | p < r = heapify $ rightSwap p
    | otherwise = Node i v (heapify l) (heapify r)
      where leftSwap (Node ip vp (Node il vl ll rl) r) = Node ip vl (Node il vp ll rl) r
            rightSwap (Node ip vp l (Node ir vr lr rr)) = Node ip vr l (Node ir vp lr rr)
            -- N.B. These pattern matches don't need to be exhaustive, given
            -- the guards above.

  toList :: (Ord a, U.Unbox a) => Heap a -> [a]
  toList h = U.toList $ U.create $ do
    vec <- M.new $ lengthH h
    massWrite h vec
    return vec
      where massWrite Empty _ = return ()
            massWrite (Node i v l r) vec = do
              M.write vec i v
              massWrite l vec
              massWrite r vec

  -- Fastest implementation I could think of. It's O (n)
  -- (branching down to the Empties is O (log n), but the real cost is in
  -- adding n 1's. It's faster than finding the largest Index, though.
  lengthH :: Heap a -> Int
  lengthH h = f h - 1
    where f Empty = 1
          f (Node _ _ l r) = f l + f r
