module Sort
( fromList
, heapSort
, insert
, Sort.length
, pop
, singleton
, toList
, update
) where

  import qualified Data.Vector.Unboxed as U
  import qualified Data.Vector.Unboxed.Mutable as M

  type Index = Int

  data Heap a = Empty | Node Index a (Heap a) (Heap a) deriving (Eq, Read, Show)

  instance (Eq a, Ord a) => Ord (Heap a) where
    Empty `compare`  Empty = EQ
    _ `compare` Empty = GT
    Empty `compare` _ = LT
    (Node _ vl _ _) `compare` (Node _ vr _ _) = vl `compare` vr

  -- I'm particularly proud of this function.
  fromList :: (Ord a, U.Unbox a) => [a] -> Heap a
  fromList [] = Empty
  fromList xs = fromList' 0 $ U.fromList xs
    where fromList' ip vec = heapify $
            case vec U.!? ip of
                 Nothing -> Empty
                 Just vp -> Node ip vp (fromList' il vec) (fromList' ir vec)
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
            -- N.B. These pattern matches don't need to be exhaustive, as
            -- combined with the guards above, all cases are covered.

  toList :: (Ord a, U.Unbox a) => Heap a -> [a]
  toList h = U.toList $ U.create $ do
    vec <- M.new $ Sort.length h
    massWrite h vec
    return vec
      where massWrite Empty _ = return ()
            massWrite (Node i v l r) vec = do
              M.write vec i v
              massWrite l vec
              massWrite r vec

  -- Fastest implementation I could think of. It's O (n) (branching down to the
  -- Empties is a cheap (n + 1) recursions, as is adding (n + 1) 1's). An
  -- alternative is to compare the Indexes of the final rank parents, but
  -- adding is cheaper.
  length :: Heap a -> Int
  length h = length' h - 1
    where length' Empty = 1
          length' (Node _ _ l r) = length' l + length' r

  update :: (Ord a) => Index -> a -> Heap a -> Heap a
  update _ _ Empty = Empty
  update i v h@(Node j w l r)
    | i == j = Node i v l r
    | i > j = heapify $ Node j w (update i v l) (update i v r)
    | i < j = h

  insert ::(Ord a) => a -> Heap a -> Heap a
  insert v Empty = singleton v
  insert v h = insert' iNew v h
    where iNew = (Sort.length h)
          insert' i v Empty = Empty
          insert' i v (Node j w l r)
            | i == 2 * j + 1 = heapify $ Node j w (Node i v Empty Empty) r
            | i == 2 * j + 2 = heapify $ Node j w l (Node i v Empty Empty)
            | otherwise = heapify $ Node j w (insert' i v l) (insert' i v r)

  singleton :: (Ord a) => a -> Heap a
  singleton v = Node 0 v Empty Empty

  pop :: (Ord a) => Heap a -> (a, Heap a)
  pop Empty = error "Empty heap"
  pop p@(Node _ v _ _) = (v, downShift p)
    where downShift (Node i _ l r)
            | l <= r =
                case r of
                     Node _ vr _ _ -> Node i vr l (downShift r)
                     Empty -> Empty -- i.e. both l & r = Empty
            | otherwise =
                case l of
                     Node _ vl _ _ -> Node i vl (downShift l) r

  heapSort :: (Ord a) => Heap a -> [a]
  heapSort Empty = []
  heapSort h =
    let (v,h') = pop h
     in v : heapSort h'
