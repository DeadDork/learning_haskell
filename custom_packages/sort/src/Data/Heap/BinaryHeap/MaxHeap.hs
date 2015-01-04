{-# LANGUAGE Unsafe #-}

--------------------------------------------------------------------------------
-- |
-- Module         : Data.Heap.BinaryHeap.MaxHeap
-- Copyright      : Nimrod Omer 2015
-- License        : MIT
--
-- Maintainer     : Nimrod Omer
-- Stability      : experimental
-- Portability    : portable
--
-- Basic max heap data structure & assorted functions.
--
--------------------------------------------------------------------------------

module Data.Heap.BinaryHeap.MaxHeap (
  -- * Heaps
  Heap (..)
  -- ** Construction functions
, singleton
, fromList
  -- ** Change heap
, insert
, update
, toList
, pop
  -- ** Retrieve data about heap
, length
, U.Unbox
) where

import qualified Data.Vector.Unboxed as U
import qualified Data.Vector.Unboxed.Mutable as M
import Prelude hiding (length)

-- | Heaps
--
-- Any ordinal type can be placed in a tree structure that has a heap property
-- at each node.

-- Each node in a heap must have an index value. This is so that the tree
-- structure of the heap is balanced.
type Index = Int

-- A heap is either empty or it has nodes that branch into more nodes, which
-- eventually branch into empty leaves.
data Heap a = Empty | Node Index a (Heap a) (Heap a) deriving (Eq, Read, Show)

-- | Comparing nodes
instance (Eq a, Ord a) => Ord (Heap a) where
  -- Two empty nodes are equal to each other.
  Empty `compare`  Empty = EQ
  -- Any non-empty node is greater than an empty node.
  _ `compare` Empty = GT
  Empty `compare` _ = LT
  -- Otherwise, two non-empty nodes are compared on the ordinal value of their
  -- contents.
  (Node _ vl _ _) `compare` (Node _ vr _ _) = vl `compare` vr

-- | Takes a list, and transforms it into a max heap.
--
-- @fromList [1,2,3] = Node 3 0 (Node 2 1 Empty Empty) (Node 1 2 Empty Empty)@
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

-- | Takes a heap and returns a list
--
-- @toList (Node 3 0 (Node 2 1 Empty Empty) (Node 1 2 Empty Empty)) = [3,2,1]@
toList :: (Ord a, U.Unbox a) => Heap a -> [a]
toList h = U.toList $ U.create $ do
  vec <- M.new $ length h
  massWrite h vec
  return vec
    where massWrite Empty _ = return ()
          massWrite (Node i v l r) vec = do
            M.write vec i v
            massWrite l vec
            massWrite r vec

-- | Retrieves the length of a heap.
length :: Heap a -> Index
length Empty = 0
length (Node i _ l r) = maximum [i, length l, length r]

-- | Changes a node in a heap at a particular index.
--
-- N.B. Because the heap property obtains, an update can change the structure
-- of the heap considerably.
--
-- @update 2 5 (Node 3 (Node 2 Empty Empty) (Node 1 Empty Empty)) =
-- Node 5 (Node 2 Empty Empty) (Node 3 Empty Empty)@
update :: (Ord a) => Index -> a -> Heap a -> Heap a
update _ _ Empty = Empty
update i v h@(Node j w l r)
  | i == j = Node i v l r
  | i > j = heapify $ Node j w (update i v l) (update i v r)
  | i < j = h

-- | Adds a new node into a heap.
--
-- N.B. Same as update, the heap property will be maintained.
--
-- @insert 3 Empty = Node 3 0 Empty Empty@
insert ::(Ord a) => a -> Heap a -> Heap a
insert v Empty = singleton v
insert v h = insert' iNew v h
  where iNew = length h
        insert' _ v Empty = Empty
        insert' i v (Node j w l r)
          | i == 2 * j + 1 = heapify $ Node j w (Node i v Empty Empty) r
          | i == 2 * j + 2 = heapify $ Node j w l (Node i v Empty Empty)
          | otherwise = heapify $ Node j w (insert' i v l) (insert' i v r)

-- | Takes a value and creates a heap with only one node.
--
-- @singleton 3 = Node 3 0 Empty Empty@
singleton :: (Ord a) => a -> Heap a
singleton v = Node 0 v Empty Empty

-- | Returns a pair of the topmost value & the heap minus that value.
--
-- N.B. Again, the heap property obtains.
--
-- @pop (Node 3 0 (Node 2 1 Empty Empty) (Node 1 2 Empty Empty)) =
-- (Node 2 0 (Node 1 1 Empty Empty) Empty@
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
